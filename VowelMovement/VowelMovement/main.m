//
//  main.m
//  VowelMovement
//
//  Created by 刘文晨 on 2024/6/9.
//

#import <Foundation/Foundation.h>
// 使用 typedef 定义 Block 对象的类型
typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"original strings: %@", originalStrings);
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        // 声明 Block 变量
        // void (^devowelizer)(id, NSUInteger, BOOL *);
        ArrayEnumerationBlock devowelizer;
        devowelizer = ^(id string, NSUInteger i, BOOL *stop)
        {
//            NSRange yRange = [string rangeOfString:@"y" options:NSCaseInsensitiveSearch];
//            if (yRange.location != NSNotFound)
//            {
//                *stop = YES; // 执行完当前的 Block 对象后终止枚举过程
//                return; // 结束当前正在执行的 Block 对象
//            }
            NSMutableString *newString = [NSMutableString stringWithString:string];
            // 枚举数组中的字符串，将所有出现的元音字符替换成空字符串
            for (NSString *vowel in vowels)
            {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:vowel withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            [devowelizedStrings addObject:newString];
        }; // Block 变量赋值结束
        
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"new strings: %@", devowelizedStrings);
    }
    return 0;
}
