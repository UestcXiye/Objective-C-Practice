//
//  BNRLogger.m
//  Callbacks
//
//  Created by 刘文晨 on 2024/6/8.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (NSString *)lastTimeString
{
    // static 让所有的 BNRLogger 实例共享一个 NSDateFormatter
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

// 动作方法总有一个实参，它是传入发送动作消息的对象
- (void)updateLastTime:(NSTimer *)timer
{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

/** 协议方法 */
// 来自 NSURLConnectionDataDelegate 协议
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{ // 收到一定字节的数据后就被调用
    NSLog(@"received %lu bytes", [data length]);
    if (!_incomingData)
    {
        _incomingData = [[NSMutableData alloc] init];
    }
    [_incomingData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{ // 最后一部分数据处理完毕后会被调用
    NSLog(@"Got it all!");
    NSString *str = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    NSLog(@"string has %lu characters", [str length]);
    NSLog(@"The whole string is %@", str);
}

// 来自 NSURLConnectionDelegate 协议
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{ // 获取数据失败时会被调用
    NSLog (@"connection failed %@", [error localizedDescription]);
    _incomingData = nil;
}

- (void)zoneChangeSelector:(NSNotification *)note
{ // 该方法将在系统发布 NSSystemTimeZoneDidChangeNotification 通知时被调用
    NSLog(@"The system time zone has changed");
}

@end
