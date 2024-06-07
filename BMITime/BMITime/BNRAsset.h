//
//  BNRAsset.h
//  BMITime
//
//  Created by 刘文晨 on 2024/6/7.
//

#import <Foundation/Foundation.h>
@class BNREmployee;

NS_ASSUME_NONNULL_BEGIN

@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, weak) BNREmployee *holder;
@property (nonatomic) unsigned int resaleValue;

@end

NS_ASSUME_NONNULL_END
