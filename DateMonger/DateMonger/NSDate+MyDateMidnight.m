//
//  NSDate+MyDateMidnight.m
//  DateMonger
//
//  Created by 刘文晨 on 2024/6/11.
//

#import "NSDate+MyDateMidnight.h"

@implementation NSDate (MyDateMidnight)

- (NSDate *)midnightInYear:(NSInteger)y month:(NSInteger)m day:(NSInteger)d
{
    // 创建 NSCalendar 对象
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    // 创建NSDateComponents对象
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:y]; // 年份
    [components setMonth:m]; // 月份
    [components setDay:d]; // 日
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    // 使用 NSCalendar 计算日期
    NSDate *date = [calendar dateFromComponents:components];
            
    return date;
    
}

@end
