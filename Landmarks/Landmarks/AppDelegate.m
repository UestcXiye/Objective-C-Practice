//
//  AppDelegate.m
//  Landmarks
//
//  Created by 刘文晨 on 2024/6/11.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - 应用委托对象的回调方法

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /* 凡是需要在程序能够和用户交互前就完成的初始化工作，都在该方法内完成 */
    // 创建并设置 UIWinodw 对象
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // self.window.rootViewController = [[UITabBarController alloc] init];
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    // 设置 UIWindow 实例的背景颜色，并放上屏幕
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
