//
//  main.m
//  VowelCounter
//
//  Created by 刘文晨 on 2024/6/11.
//

#import <Foundation/Foundation.h>
#import "NSString+BNRVowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"Hello, world!";
        NSLog(@"\"%@\" has %d vowels", str, [str bnr_vowelCount]);
    }
    return 0;
}
