//
//  main.m
//  Callbacks
//
//  Created by 刘文晨 on 2024/6/8.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // 通知
        [[NSNotificationCenter defaultCenter]
            addObserver:logger // 将 logger 注册为观察者
            selector:@selector(zoneChange:)
            name:NSSystemTimeZoneDidChangeNotification // 通知名
            object:nil];
        
        // 辅助对象
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        // __unused 修饰符，消除编译器警告
        __unused NSURLConnection *fetchConn =
            [[NSURLConnection alloc] initWithRequest:request
                                        delegate:logger // logger 是 NSURLConnection 的委托对象
                                    startImmediately:YES];
        // 目标-动作对
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                            target:logger // logger 是 timer 的目标
                            selector:@selector(updateLastTime:) // 传递动作消息的名称
                            userInfo:nil
                            repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
