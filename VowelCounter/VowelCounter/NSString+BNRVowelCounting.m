//
//  NSString+BNRVowelCounting.m
//  VowelCounter
//
//  Created by 刘文晨 on 2024/6/11.
//

#import "NSString+BNRVowelCounting.h"

@implementation NSString (BNRVowelCounting)

- (int)bnr_vowelCount
{
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
    int count = 0;
    for (int i = 0; i < [self length]; i++)
    {
        unichar c = [self characterAtIndex:i];
        if ([charSet characterIsMember:c])
            count++;
    }
    return count;
}

@end
