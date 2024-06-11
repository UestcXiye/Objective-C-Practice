//
//  main.m
//  DateMonger
//
//  Created by 刘文晨 on 2024/6/11.
//

#import <Foundation/Foundation.h>
#import "NSDate+MyDateMidnight.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int year = 2000;
        printf("input the year: ");
        scanf("%d", &year);
        int month = 4;
        printf("input the month: ");
        scanf("%d", &month);
        int day = 10;
        printf("input the day: ");
        scanf("%d", &day);
        NSDate *d = [[NSDate alloc] midnightInYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day];
        NSLog(@"Midnight in your date: %@", d);
    }
    return 0;
}
