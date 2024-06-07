//
//  BNRPerson.h
//  BMITime
//
//  Created by 刘文晨 on 2024/6/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRPerson : NSObject

@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;

- (float)bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
