//
//  main.m
//  TimeAfterTime
//
//  Created by 刘文晨 on 2024/6/5.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 向 NSDate 类发送 date 消息，让它执行 date 方法
        NSDate *now = [NSDate date];
        // 打印实例的地址
        NSLog(@"This NSDate object lives at %p", now);
        // %@ 会输出相应对象的“描述信息”
        NSLog(@"The date is %@", now);
        // 实例方法
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has benen %f seconds since the start of 1970.", seconds);
    }
    return 0;
}
