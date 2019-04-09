//
//  ViewController.m
//  AlertViewDemo
//
//  Created by 尹华东 on 2019/4/9.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat btnY = 100;
    for (int i = 0; i < 5; i ++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [btn setFrame:CGRectMake(0, 0, 120, 40)];
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
        [btn setTag:i];
        [self.view addSubview:btn];
        
        [btn setCenter:CGPointMake(self.view.frame.size.width/2, btnY)];
        
        btnY += 60;
    }
}

- (void)doTap:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
        {
            [self showAlertView:@"提示1" subTitle:@"提示内容" defaultBtnTitle:@"按钮1" defaultBtnHandler:^{
                NSLog(@"点击了按钮1");
            } secondBtnTitle:@"按钮2" secondBtnHandler:^{
                NSLog(@"点击了按钮2");
            }];
        }
            break;
            
        case 1:
        {
            [self showAlertView:@"提示2" subTitle:@"提示内容" defaultBtnTitle:@"按钮1" defaultBtnHandler:^{
                NSLog(@"点击了按钮1");
            } secondBtnTitle:@"按钮2" secondBtnHandler:^{
                NSLog(@"点击了按钮2");
            } upLetf:YES];
        }
            break;
            
        case 2:
        {
            [self showAlertViewWithPic:@"show" title:@"提示3" defaultBtnTitle:@"按钮1" defaultBtnHandler:^{
                NSLog(@"点击了按钮1");
            } secondBtnTitle:@"按钮2" secondBtnHandler:^{
                NSLog(@"点击了按钮2");
            }];
        }
            break;
            
        case 3:
        {
            [self showAlertView:@"提示4" subTitle:@"提示内容" defaultBtnTitle:@"按钮1" defaultBtnHandler:^{
                NSLog(@"点击了按钮1");
            } secondBtnTitle:@"按钮2" secondBtnHandler:^{
                NSLog(@"点击了按钮2");
            } dismissOpened:YES];
        }
            break;
            
        case 4:
        {
            [self showAlertViewWithPic:@"show" PicWidth:100 PicHeight:100 title:@"提示5" defaultBtnTitle:@"按钮1" defaultBtnHandler:^{
                NSLog(@"点击了按钮1");
            } secondBtnTitle:@"按钮2" secondBtnHandler:^{
                NSLog(@"点击了按钮2");
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
