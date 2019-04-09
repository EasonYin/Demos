//
//  ViewController.m
//  notifacation_test
//
//  Created by 尹华东 on 2018/12/11.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pushTitle;
@property (weak, nonatomic) IBOutlet UITextField *pushContent;
@property (weak, nonatomic) IBOutlet UITextField *pushUrl;
@property (weak, nonatomic) IBOutlet UIImageView *pushMedia;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"push test";
    
    self.pushTitle.text = @"push test title";
    self.pushContent.text = @"push test content";
    self.pushUrl.text = @"https://www.baidu.com";
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"photo" ofType:@"png"];
    self.pushMedia.image = [UIImage imageNamed:filePath];
}

- (void)setupNotifacation{
    //1.初始化通知
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @1;
    content.title = self.pushTitle.text;
    content.body = self.pushContent.text;
    UNNotificationSound *sound = [UNNotificationSound defaultSound];
    content.sound = sound;//通知声音
    content.userInfo = @{@"pushUrl":self.pushUrl.text};

    content.categoryIdentifier = @"uid";//不要急，后面有解释
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];//1秒后推送
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"photo" ofType:@"png"];
    if (filePath && ![filePath isEqualToString:@""]) {
        UNNotificationAttachment * attachment = [UNNotificationAttachment attachmentWithIdentifier:@"photo" URL:[NSURL URLWithString:[@"file://" stringByAppendingString:filePath]] options:nil error:nil];
        if (attachment) {
            content.attachments = @[attachment];
        }
        //localPath是我通过拿到相册图片存到本地的路径（为什么不用url直接下载图片拼接本地路径呢，因为产品想要用，他们想自己从相册选照片！！！），总之把一个本地图片的url丢到attachment里面就可以发送一个有图片的通知了，视频也是一样用法呢。
    }
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"push" content:content trigger:trigger];
    //参数就是触发时机和通知组建
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
    
}

#pragma mark - actions
- (IBAction)push:(id)sender {
    [self setupNotifacation];
    
}


@end
