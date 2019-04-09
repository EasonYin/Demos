//
//  ViewController.m
//  DynamicAppIcon_test
//
//  Created by 尹华东 on 2018/10/25.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    for (int i = 1; i < 5; i ++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [btn setFrame:CGRectMake(0, 0, 100, 40)];
        [btn setBackgroundColor:[UIColor greenColor]];
        [btn setTag:100+i];
        [btn setTitle:[NSString stringWithFormat:@"%zd",btn.tag] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(dotap:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btn];
        [btn setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height*i/8)];
    }
    
}

- (void)dotap:(UIButton*)sender{
    switch (sender.tag) {
        case 101:
        {
            [self changeAppIconWithName:@"icon_tjj_01"];
        }
            break;
        case 102:
        {
            [self changeAppIconWithName:@"icon_tjj_02"];
        }
            break;
        case 103:
        {
            [self changeAppIconWithName:@"test"];
        }
            break;

        default:
        {
            [self changeAppIconWithName:@""];
        }
            break;
    }
}

- (void)changeAppIconWithName:(NSString *)iconName {
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
        
    }];
    NSLog(@"当前icon名称：%@",[[UIApplication sharedApplication] alternateIconName]);

}


@end
