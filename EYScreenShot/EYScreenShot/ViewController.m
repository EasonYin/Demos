//
//  ViewController.m
//  EYScreenShot
//
//  Created by 尹华东 on 2019/5/14.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import "EYScreenShot.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    EYScreenShot *eyScreenShot = [EYScreenShot sharedEYScreenShot];
    
    [EYScreenShot registerSystemScreenShotNotificationWithBlock:^{
        NSLog(@"检测到截屏");
        
        //人为截屏, 模拟用户截屏行为, 获取所截图片
        UIImage *image_ = [eyScreenShot imageWithScreenshot];
        
        //添加显示
        UIImageView *imgvPhoto = [[UIImageView alloc]initWithImage:image_];
        imgvPhoto.frame = CGRectMake([UIApplication sharedApplication].keyWindow.frame.size.width/2, [UIApplication sharedApplication].keyWindow.frame.size.height/2, [UIApplication sharedApplication].keyWindow.frame.size.width/2, [UIApplication sharedApplication].keyWindow.frame.size.height/2);
        
        //添加边框
        CALayer * layer = [imgvPhoto layer];
        layer.borderColor = [
                             [UIColor whiteColor] CGColor];
        layer.borderWidth = 5.0f;
        //添加四个边阴影
        imgvPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
        imgvPhoto.layer.shadowOffset = CGSizeMake(0, 0);
        imgvPhoto.layer.shadowOpacity = 0.5;
        imgvPhoto.layer.shadowRadius = 10.0;
        //添加两个边阴影
        imgvPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
        imgvPhoto.layer.shadowOffset = CGSizeMake(4, 4);
        imgvPhoto.layer.shadowOpacity = 0.5;
        imgvPhoto.layer.shadowRadius = 2.0;
        
        [[UIApplication sharedApplication].keyWindow addSubview:imgvPhoto];
    }];
}


@end
