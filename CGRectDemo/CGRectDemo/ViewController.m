//
//  ViewController.m
//  CGRectDemo
//
//  Created by 尹华东 on 2019/4/19.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import "CGRectDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"ViewController";

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    //获取view的最小X值，也就是这个view的X值
    CGFloat minX = CGRectGetMinX(view.frame);
    NSLog(@"minx is %f",minX);
    
    //获取view的最大的X值，也就是这个view的X值+view的宽
    CGFloat maxX = CGRectGetMaxX(view.frame);
    NSLog(@"maxX is %f",maxX);
    
    //获取view的最小Y值，也就是这个view的Y值
    CGFloat minY = CGRectGetMinY(view.frame);
    NSLog(@"minY is %f",minY);
    
    //获取view的最大Y值，也就是这个view的Y值+view的高度
    CGFloat maxY = CGRectGetMaxY(view.frame);
    NSLog(@"maxY is %f",maxY);
    
    //获取view的中点X
    CGFloat midX = CGRectGetMidX(view.frame);
    NSLog(@"midX is %f",midX);
    
    //获取view的中点Y
    CGFloat midY = CGRectGetMidY(view.frame);
    NSLog(@"midY is %f",midY);
    
    //获取view的高
    CGFloat getWidth = CGRectGetWidth(view.frame);
    NSLog(@"getWidth is %f",getWidth);
    
    //获取view的宽
    CGFloat getHeight = CGRectGetHeight(view.frame);
    NSLog(@"getHeight is %f",getHeight);
    
    //判断两个view大小是否一样
    BOOL flag = CGRectEqualToRect(view.frame, self.view.frame);
    NSLog(@"flag is %d",flag);
    
    //
    CGRect rect = CGRectStandardize(view.frame);
    NSLog(@"rect x = %f, y = %f, width = %f, height = %f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    
    //判断view的rect是否为空
    BOOL flag1 = CGRectIsNull(view.frame);
    NSLog(@"flag is %d",flag1);
    //断view的rect是否为空
    BOOL flag2 = CGRectIsEmpty(view.frame);
    NSLog(@"flag2 is %d",flag2);
    
    //基于某个view，传入X和Y，获取一个新的rect。
    //官方文档给出的解释是另个view是否相交
    CGRect smallRect = CGRectInset(view.frame, -10, 10);
    NSLog(@"%f,%f,%f,%f",smallRect.origin.x,smallRect.origin.y,smallRect.size.width,smallRect.size.height);
    
    UIView *view1 = [[UIView alloc]initWithFrame:smallRect];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)doTap:(UIGestureRecognizer*)tap{
    SwiftDemo *vc = [[SwiftDemo alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
