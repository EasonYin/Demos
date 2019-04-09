//
//  ViewController.m
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 200, 40);
    label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    label.text = @"ViewController";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
