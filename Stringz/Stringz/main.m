//
//  main.m
//  Stringz
//
//  Created by 刘文晨 on 2024/6/7.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /** 1. 将 NSString 对象写入文件 */
//        NSMutableString *str = [[NSMutableString alloc] init];
//        for (int i = 0; i < 10; i++)
//        {
//            [str appendString:@"Objective-C is cool!"];
//        }
//        // 只有当错误发生时，才会由 writeToFile 创建 NSError 对象
//        NSError *error;
//        // 注意 error 传的是引用
//        BOOL success = [str writeToFile:@"/tmp/cool.txt"
//                             atomically:YES
//                               encoding:NSUTF8StringEncoding
//                                  error:&error];
//        if (success)
//        {
//            NSLog(@"done writing /tmp/cool.txt");
//        }
//        else
//        {
//            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
//        }
        
        /** 通过 NSString 读取文件  */
//        NSError *error;
//        NSString *str = [[NSString alloc]
//                         initWithContentsOfFile:@"etc/resolv.conf"
//                         encoding:NSASCIIStringEncoding
//                         error:&error];
//        if (!str)
//        {
//            NSLog(@"read failed: %@", [error localizedDescription]);
//        }
//        else
//        {
//            NSLog(@"resolv.conf looks like this: %@", str);
//        }
        
        /** 将 NSData 对象数据写入文件 */
//        NSURL *url = [NSURL URLWithString:@"http://google.com/images/logos/ps_logo2.png"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        NSError *error = nil;
//        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
//        
//        if (!data)
//        {
//            NSLog(@"fetch failed: %@", [error localizedDescription]);
//            return EXIT_FAILURE;
//        }
//        
//        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
//        BOOL written = [data writeToFile:@"/tmp/google.png" options:0 error:&error];
//        
//        if (!written)
//        {
//            NSLog(@"write failed: %@", [error localizedDescription]);
//            return EXIT_FAILURE;
//        }
//        NSLog(@"Write succeed");
//        // 从文件读取数据并存入 NSData 对象
//        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
//        NSLog(@"The file of read from the disk has %lu bytes", (unsigned long)[readData length]);
        
        /** 寻找特别目录 */
        NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        NSString *desktopPath = desktops[0];
        NSLog(@"%@", desktopPath);
    }
    return 0;
}
