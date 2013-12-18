//
//  AppDelegate.m
//  ACSideslipTransition
//
//  Created by Albert Chu on 13-12-17.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    //** 以 push 形式弹出的下一级视图控制器中的 返回按钮 自定义图片 ****************************************
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"nav_back.png"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"nav_back.png"]];
    
    // 位移隐藏掉文字
    [UIBarButtonItem.appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
    //*********************************************************************************************;
    
    
    
    FirstViewController *fVC = [[FirstViewController alloc] init];
    self.window.rootViewController = fVC;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
