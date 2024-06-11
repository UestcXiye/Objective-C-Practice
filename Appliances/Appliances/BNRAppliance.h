//
//  BNRAppliance.h
//  Appliances
//
//  Created by 刘文晨 on 2024/6/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

- (instancetype)initWithProductName:(NSString *)pn;

@end

NS_ASSUME_NONNULL_END
