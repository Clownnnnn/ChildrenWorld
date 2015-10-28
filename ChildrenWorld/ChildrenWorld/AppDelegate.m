//
//  AppDelegate.m
//  ChildrenWorld
//
//  Created by imac on 15/10/14.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "AppDelegate.h"
#import "LeadViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    LeadViewController *lead_vc = [[LeadViewController alloc]init];
    
    NSString *key = (NSString *)kCFBundleVersionKey;
    //1.在plist文件中获取版本号
    NSDictionary *dic = [NSBundle mainBundle].infoDictionary;
    NSString *versionStr = dic[key];
    //[dic objectForKey:key]与dic[key]是一个意思;
    NSLog(@"版本号：%@",versionStr);
    
    //到preferrence中去查找是否有这个版本号
    NSString *versionString =  [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if ([versionString isEqualToString:versionStr]) {
        //不是第一次使用这个版本
//        self.window.rootViewController = lead_vc;
        [self changeRootController];
    }else{
        //是第一次使用这个版本
        self.window.rootViewController = lead_vc;
        [[NSUserDefaults standardUserDefaults] setObject:versionStr forKey:key];
    }
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)changeRootController
{
    MainViewController *main_vc = [[MainViewController alloc]init];
    self.window.rootViewController = main_vc;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
