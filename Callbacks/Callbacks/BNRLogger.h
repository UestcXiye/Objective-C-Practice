//
//  BNRLogger.h
//  Callbacks
//
//  Created by 刘文晨 on 2024/6/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRLogger : NSObject
    <NSURLConnectionDelegate, NSURLConnectionDataDelegate> // 声明 BNRLogger 会实现这两种协议方法
{
    NSMutableData *_incomingData; // 保存接收的数据
}
@property (nonatomic) NSDate *lastTime;

- (NSString *)lastTimeString;
// 动作方法
- (void)updateLastTime:(NSTimer *)timer;

@end

NS_ASSUME_NONNULL_END
