//
//  AppDelegate.m
//  TouchDemo
//
//  Created by 尹华东 on 2019/4/15.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

/*
 1.程序启动时，UIApplication会生成一个单例，并会关联一个APPDelegate。APPDelegate作为整个响应链的根建立起来，UIApplication的nextResponser为APPDelegate。
 2.程序启动后，任何的UIWindow被创建时，UIWindow内部都会把nextResponser设置为UIApplication单例。
 3.UIWindow初始化rootViewController, rootViewController的nextResponser会设置为UIWindow。
 4.UIViewController初始化View，View的nextResponser会设置为rootViewController。
 5.AddSubView时，如果subView不是ViewController的View,那么subView的nextResponser会被设置为superView。否则就是 subView -> subView.VC ->superView。
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
////    ViewController *vc = [[ViewController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    self.window.rootViewController = nav;
//    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
