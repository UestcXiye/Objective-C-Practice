//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by 刘文晨 on 2024/6/10.
//

#import "BNRAppliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNROwnedAppliance : BNRAppliance

@property (readonly)NSSet *ownerNames;

- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n;
- (void)addOwnerName:(NSString *)n;
- (void)removeOwnerName:(NSString *)n;

@end

NS_ASSUME_NONNULL_END
