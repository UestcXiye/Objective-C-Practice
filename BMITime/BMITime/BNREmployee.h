//
//  BNREmployee.h
//  BMITime
//
//  Created by 刘文晨 on 2024/6/7.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"
@class BNRAsset;

NS_ASSUME_NONNULL_BEGIN

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;
//@property (nonatomic) NSString *lastName;
//@property (nonatomic) BNRPerson *spouse;
@property (nonatomic) NSArray *assets;

- (double)yearsOfEmployment;
- (void)addAsset:(BNRAsset *)asset;
- (unsigned int)valueOfAssets;

@end

NS_ASSUME_NONNULL_END
