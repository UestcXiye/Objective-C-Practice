//
//  BNRAppliance.m
//  Appliances
//
//  Created by 刘文晨 on 2024/6/10.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (instancetype)init
{
    // 调用 NSObject 的 init 方法
//    self = [super init];
//    if (self)
//    {
//        self.voltage = 120;
//    }
//    return self;
    return [self initWithProductName:@"Unknown"];
}

- (instancetype)initWithProductName:(NSString *)pn
{
    self = [super init];
    if (self)
    {
        _productName = [pn copy];
        _voltage = 120;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
}

@end
