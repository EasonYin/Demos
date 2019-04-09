//
//  SecondViewController.m
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 200, 40);
    label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-100);
    label.text = @"SecondViewController";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    //是否是二级页面
    if (self.navigationController.viewControllers.count == 1){
        return;
    }
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setFrame:CGRectMake(0, 0, 100, 20)];
    [btn setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+100)];
    [btn setTitle:@"隐藏" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(dismissVC) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
}

- (void)dismissVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
