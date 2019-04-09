//
//  AppDelegate+ViewController.h
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "AppDelegate.h"

#import "myTabBarViewController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface AppDelegate (ViewController)

@property (nonatomic, strong) myTabBarViewController *tabbarController;
@property (nonatomic, strong) ViewController *homeViewController;
@property (nonatomic, strong) SecondViewController *privateViewController;


- (void)launchVC;

@end
