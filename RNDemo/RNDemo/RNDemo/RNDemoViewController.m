//
//  RNDemoViewController.m
//  RNDemo
//
//  Created by 尹华东 on 2019/6/3.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "RNDemoViewController.h"
#import <React/RCTRootView.h>
@interface RNDemoViewController ()

@end

@implementation RNDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                         moduleName        : @"RNDemo"
                         initialProperties : nil
                          launchOptions    : nil];
    
    self.view = rootView;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

@end
