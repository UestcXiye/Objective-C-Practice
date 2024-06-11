//
//  NSDate+MyDateMidnight.h
//  DateMonger
//
//  Created by 刘文晨 on 2024/6/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MyDateMidnight)

- (NSDate *)midnightInYear:(NSInteger)y month:(NSInteger)m day:(NSInteger)d;

@end

NS_ASSUME_NONNULL_END
