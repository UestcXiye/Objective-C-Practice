//
//  BNRAsset.m
//  BMITime
//
//  Created by 刘文晨 on 2024/6/7.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *)description
{
    if (self.holder)
    {
        return [NSString stringWithFormat:@"<%@: $%u assigned to %@>", self.label, self.resaleValue, self.holder];
    }
    else
    {
        return [NSString stringWithFormat:@"<%@: $%u unassigned>", self.label, self.resaleValue];
    }
}
- (void) dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
