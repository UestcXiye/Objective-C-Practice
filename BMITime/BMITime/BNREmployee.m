//
//  BNREmployee.m
//  BMITime
//
//  Created by 刘文晨 on 2024/6/7.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

@interface BNREmployee()
{
    NSMutableArray *_assets;
}
@end

@implementation BNREmployee

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u, $%u in assets>", self.employeeID, self.valueOfAssets];
}
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

- (float)bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}
- (double)yearsOfEmployment
{
    if (self.hireDate)
    {
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0;
    }
    else
        return 0;
}

- (void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}
- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a
{
    if (!_assets)
    {
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:a];
    a.holder = self;
}
- (unsigned int)valueOfAssets
{
    unsigned int sum = 0;
    for (BNRAsset *a in _assets)
    {
        sum += [a resaleValue];
    }
    return sum;
}

@end
