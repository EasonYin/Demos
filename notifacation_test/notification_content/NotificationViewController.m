//
//  NotificationViewController.m
//  notification_content
//
//  Created by 尹华东 on 2018/12/11.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface NotificationViewController () <UNNotificationContentExtension>
@property IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *body;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    UNNotificationContent *bestAttemptContent = notification.request.content;
    // 从content中取出所需的数据
    self.label.text = bestAttemptContent.title;
    self.subTitle.text = bestAttemptContent.subtitle;
    self.body.text = bestAttemptContent.body;
    
    NSData *imageData = bestAttemptContent.userInfo[@"image"];
    UIImage *showImage = [UIImage imageWithData:imageData];
    self.image.image = showImage;
}

- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion{
    NSLog(@"actionIdentifier: %@",response.actionIdentifier);
    
    if ([response.actionIdentifier isEqualToString:@"ActionA"]) {
        
    }
    else if ([response.actionIdentifier isEqualToString:@"ActionB"]){

    }
    else if ([response.actionIdentifier isEqualToString:@"ActionC"]){

    }
    else if ([response.actionIdentifier isEqualToString:@"ActionD"]){

    }
    
    //隐藏通知进入应用
    completion(UNNotificationContentExtensionResponseOptionDismissAndForwardAction);
    
}

@end
