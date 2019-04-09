//
//  AppDelegate.m
//  notifacation_test
//
//  Created by 尹华东 on 2018/12/11.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
    
    UNUserNotificationCenter *notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    notificationCenter.delegate = self;
    [notificationCenter requestAuthorizationWithOptions:7 completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"%d--%@", granted, error);
        //注册apns
        [[UIApplication sharedApplication] registerForRemoteNotifications];

    }];; //option参数设置支持通知的样式，声音，横幅，弹框，等
    
    //apns推送
    /*
     {
        "aps": {
            "alert": {
                "title": "pushTitle",
                "subtitle": "push subTitle",
                "body": "pushBody"
            },
            "badge": 0,
            "sound": "default",
            "mutable-content": "1",
            "category": "myNotificationCategory"
            },
        "pushUrl": "openjdtjj://virtual?params={\"category\":\"jump\",\"des\":\"webactivity\",\"type\":\"3\",\"title\":\"title\",\"webUrl\":\"https://www.baidu.com/\"}",
        "image": "http://pic1.win4000.com/pic/7/cc/79031200498_250_350.jpg"
     }
     */
    return YES;
}

#pragma mark - notificationDelegate
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    
    NSString *pushUrl = response.notification.request.content.userInfo[@"pushUrl"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"跳转url" message:pushUrl preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:[UIAlertAction actionWithTitle:@"done" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    completionHandler();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{

}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    // 允许在前台展示消息，不设置的话，默认是不行的
    completionHandler(UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionSound);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"deviceToken is：%@",deviceToken);
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"%@",error);
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
