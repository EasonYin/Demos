//
//  NotificationService.m
//  notification_server
//
//  Created by 尹华东 on 2018/12/11.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "NotificationService.h"

@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    // Modify the notification content here...
    self.bestAttemptContent.title = [NSString stringWithFormat:@"%@ [serverTitle]", self.bestAttemptContent.title];
    self.bestAttemptContent.subtitle = [NSString stringWithFormat:@"%@ [serverSubTitle]", self.bestAttemptContent.subtitle];

    //  调用self.contentHandler(self.bestAttemptContent)时既发出通知，我们需要在调用前设置好参数
    //  处理想要显示的内容，可修改的字段可以查看UNMutableNotificationContent下的属性
    self.bestAttemptContent.body = [NSString stringWithFormat:@"%@ [serverBody]", self.bestAttemptContent.body];//@"xxxx";
    
    //  添加交互按钮
    NSMutableArray *actionMutableArr = [[NSMutableArray alloc] initWithCapacity:1];
    UNNotificationAction * actionA  =[UNNotificationAction actionWithIdentifier:@"ActionA" title:@"ActionA" options:UNNotificationActionOptionAuthenticationRequired];
    UNNotificationAction * actionB = [UNNotificationAction actionWithIdentifier:@"ActionB" title:@"ActionB" options:UNNotificationActionOptionDestructive];
    UNNotificationAction * actionC = [UNNotificationAction actionWithIdentifier:@"ActionC" title:@"ActionC" options:UNNotificationActionOptionForeground];
    UNTextInputNotificationAction * actionD = [UNTextInputNotificationAction actionWithIdentifier:@"ActionD" title:@"ActionD" options:UNNotificationActionOptionDestructive textInputButtonTitle:@"send" textInputPlaceholder:@"say some thing"];
    [actionMutableArr addObjectsFromArray:@[actionA,actionB,actionC,actionD]];
    
    if (actionMutableArr.count) {
        UNNotificationCategory * notficationCategory = [UNNotificationCategory categoryWithIdentifier:@"myNotificationCategory" actions:actionMutableArr intentIdentifiers:@[@"ActionA",@"ActionB",@"ActionC",@"ActionD"] options:UNNotificationCategoryOptionCustomDismissAction];
        
        [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:[NSSet setWithObject:notficationCategory]];
        
    }
    
    //imgUrl中存放的是解析出的图片地址，通常我们放在usrInfo的对应字段中
    NSDictionary *dict =  self.bestAttemptContent.userInfo;
    NSString *imgUrl = dict[@"image"];
    
    [[UNUserNotificationCenter currentNotificationCenter] getDeliveredNotificationsWithCompletionHandler:^(NSArray<UNNotification *> * _Nonnull notifications) {
        for (UNNotification *obj in notifications) {
            
            if ([obj.request.content.userInfo[@"id"] isEqualToString:self.bestAttemptContent.userInfo[@"id"]]) {
                
                [[UNUserNotificationCenter currentNotificationCenter] removeDeliveredNotificationsWithIdentifiers:@[obj.request.identifier]];
            }
        }
    }];
    
    if (!imgUrl || !imgUrl.length)
    {
        self.contentHandler(self.bestAttemptContent);
    }
    
    [self loadAttachmentForUrlString:imgUrl withType:@"png" completionHandle:^(UNNotificationAttachment *attach) {
        
        if (attach) {
            self.bestAttemptContent.attachments = [NSArray arrayWithObject:attach]; //  将下载的内容设置在附件中
        }
        self.contentHandler(self.bestAttemptContent);
        
    }];
    
}

- (void)loadAttachmentForUrlString:(NSString *)urlStr
                          withType:(NSString *)type
                  completionHandle:(void(^)(UNNotificationAttachment *attach))completionHandler{
    __block UNNotificationAttachment *attachment = nil;
    NSURL *attachmentURL = [NSURL URLWithString:urlStr];
    NSString *fileExt = [self fileExtensionForMediaType:type];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session downloadTaskWithURL:attachmentURL
                completionHandler:^(NSURL *temporaryFileLocation, NSURLResponse *response, NSError *error) {
                    if (error != nil) {
                        NSLog(@"%@", error.localizedDescription);
                    } else {
                        NSFileManager *fileManager = [NSFileManager defaultManager];
                        NSURL *localURL = [NSURL fileURLWithPath:[temporaryFileLocation.path stringByAppendingString:fileExt]];
                        [fileManager moveItemAtURL:temporaryFileLocation toURL:localURL error:&error];
                        
                        NSMutableDictionary * dict = [self.bestAttemptContent.userInfo mutableCopy];
                        [dict setObject:[NSData dataWithContentsOfURL:localURL] forKey:@"image"];
                        self.bestAttemptContent.userInfo = dict;
                        
                        NSError *attachmentError = nil;
                        attachment = [UNNotificationAttachment attachmentWithIdentifier:@"" URL:localURL options:nil error:&attachmentError];
                        if (attachmentError) {
                            NSLog(@"%@", attachmentError.localizedDescription);
                        }
                    }
                    completionHandler(attachment);
                }] resume];
}

- (NSString *)fileExtensionForMediaType:(NSString *)type {
    NSString *ext = type;
    if ([type isEqualToString:@"image"]) {
        ext = @"jpg";
    }
    if ([type isEqualToString:@"video"]) {
        ext = @"mp4";
    }
    if ([type isEqualToString:@"audio"]) {
        ext = @"mp3";
    }
    return [@"." stringByAppendingString:ext];
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}

@end
