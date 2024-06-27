//
//  AppDelegate.m
//  ViewControllerLifeCircle
//
//  Created by 刘文晨 on 2024/6/27.
//

#import "AppDelegate.h"
#import "AViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建并设置 UIWinodw 对象
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    AViewController *avc = [[AViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:avc];
    self.window.rootViewController = navigationController;
    // 设置 UIWindow 实例的背景颜色，并放上屏幕
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
