//
//  AppDelegate+ViewController.m
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "AppDelegate+ViewController.h"
#import <objc/runtime.h>

#import "EyUserInfoManager.h"

static const void *kTabbarVCObjectKey;
static const void *kHomeVCObjectKey;
static const void *kPrivateVCObjectKey;

@implementation AppDelegate (ViewController)

- (void)launchVC{
    
    [self showLaunchVC];
    [self showPrivateVC];
    [self isUserLogin];
    
}

- (void)showLaunchVC{
    
    if (![[EyUserInfoManager sharedManager]showLaunchView]) {
        //显示欢迎页
        
    }
    
}

- (void)showPrivateVC{
    if (![[EyUserInfoManager sharedManager]showPrivateView]) {
        //显示隐私页面
        [self.window.rootViewController presentViewController:self.privateViewController animated:YES completion:nil];
    }
}

- (void)isUserLogin {
    if (![[EyUserInfoManager sharedManager]isUserLogin]) {
        //未登录显示登陆页面
        
    }
}

#pragma mark - lazyinitVC
//tabbar
- (myTabBarViewController *)tabbarController
{
    myTabBarViewController *tabbarController = objc_getAssociatedObject(self, &kTabbarVCObjectKey);
    if (!tabbarController)
    {
        tabbarController = [[myTabBarViewController alloc] init];
        objc_setAssociatedObject(self, &kTabbarVCObjectKey, tabbarController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return tabbarController;
}
- (void)setTabbarController:(myTabBarViewController *)tabbarController
{
    objc_setAssociatedObject(self, &kTabbarVCObjectKey, tabbarController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//主页
- (ViewController *)homeViewController{
    ViewController *homeViewController = objc_getAssociatedObject(self, &kHomeVCObjectKey);
    if (!homeViewController){
        homeViewController = [[ViewController alloc]init];
        objc_setAssociatedObject(self, &kHomeVCObjectKey, homeViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return homeViewController;
}
- (void)setHomeViewController:(ViewController *)homeViewController{
    objc_setAssociatedObject(self, &kHomeVCObjectKey, homeViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//隐私页
- (SecondViewController *)privateViewController{
    SecondViewController *privateViewController = objc_getAssociatedObject(self, &kPrivateVCObjectKey);
    if (!privateViewController){
        privateViewController = [[SecondViewController alloc]init];
        objc_setAssociatedObject(self, &kPrivateVCObjectKey, privateViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return privateViewController;
}
- (void)setPrivateViewController:(SecondViewController *)privateViewController{
    objc_setAssociatedObject(self, &kPrivateVCObjectKey, privateViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
