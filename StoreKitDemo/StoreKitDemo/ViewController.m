//
//  ViewController.m
//  StoreKitDemo
//
//  Created by EasonYin on 2019/8/26.
//  Copyright © 2019 EasonYin. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>

@interface ViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setFrame:CGRectMake(0, 0, 120, 40)];
    [btn setTitle:@"弹出应用界面" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    [btn setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    
}

- (void)doTap:(id)sender{
    
    SKStoreProductViewController *appStore = [[SKStoreProductViewController alloc] init];
    appStore.delegate = self;
    [self presentViewController:appStore animated:YES completion:^{
        // 先去跳转再去加载页面，体验感方面会好很多
        [appStore loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@"appId"} completionBlock:^(BOOL result, NSError * _Nullable error) {
            if (error) {
                NSLog(@"错误 %@",error);
            } else {
            }
        }];
    }];
    
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
