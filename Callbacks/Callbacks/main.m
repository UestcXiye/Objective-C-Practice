//
//  main.m
//  Callbacks
//
//  Created by 刘文晨 on 2024/6/8.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"
#import "BNRObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // 通知
        /*
        [[NSNotificationCenter defaultCenter]
            addObserver:logger // 将 logger 注册为观察者
            selector:@selector(zoneChangeSelector:)
            name:NSSystemTimeZoneDidChangeNotification // 通知名
            object:nil];
        // 转而用 Block 对象实现
        void (^zoneChange)(NSNotification *note); // 声明
        zoneChange = ^(NSNotification *note)
        { // 该方法将在系统发布 NSSystemTimeZoneDidChangeNotification 通知时被调用
            NSLog(@"The system time zone has changed");
        };
        [[NSNotificationCenter defaultCenter]
            addObserverForName:NSSystemTimeZoneDidChangeNotification
            object:nil
            queue:nil
            usingBlock:zoneChange];
        */
        
        // 辅助对象
        /*
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        // __unused 修饰符，消除编译器警告
        __unused NSURLConnection *fetchConn =
            [[NSURLConnection alloc] initWithRequest:request
                                        delegate:logger // logger 是 NSURLConnection 的委托对象
                                    startImmediately:YES];
        */
        
        // 目标-动作对
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                            target:logger // logger 是 timer 的目标
                            selector:@selector(updateLastTime:) // 传递动作消息的名称
                            userInfo:nil
                            repeats:YES];
        
        __unused BNRObserver *observer = [[BNRObserver alloc] init];
        // 一旦 logger 的 lastTime 发生变化，通知 observer 改变的新值和之前的旧值
        [logger addObserver:observer
                 forKeyPath:@"lastTimeString"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
