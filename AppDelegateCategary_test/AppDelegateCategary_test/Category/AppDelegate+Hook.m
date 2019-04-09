//
//  AppDelegate+Hook.m
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "AppDelegate+Hook.h"
#import <objc/runtime.h>

//交换方法
void SwizzlingMethod(Class class, SEL originSEL, SEL swizzledSEL)
{
    Method originMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = nil;
    
    if (!originMethod)
    {// 处理为类方法
        originMethod = class_getClassMethod(class, originSEL);
        if (!originMethod)
        {
            return;
        }
        swizzledMethod = class_getClassMethod(class, swizzledSEL);
        if (!swizzledMethod)
        {
            return;
        }
    }
    else
    {// 处理实例方法
        swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
        if (!swizzledMethod)
        {
            return;
        }
    }
    
    if(class_addMethod(class, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)))
    { //自身已经有了就添加不成功，直接交换即可
        class_replaceMethod(class, swizzledSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }
    else
    {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}

@implementation AppDelegate (Hook)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self jdey_AppDelegateHook];
    });
}

+ (void)jdey_AppDelegateHook
{
    SwizzlingMethod([AppDelegate class], @selector(application:didFinishLaunchingWithOptions:), @selector(jdey_application:didFinishLaunchingWithOptions:));
    SwizzlingMethod([AppDelegate class], @selector(application:handleOpenURL:), @selector(jdey_application:handleOpenURL:));
    SwizzlingMethod([AppDelegate class], @selector(application:openURL:sourceApplication:annotation:), @selector(jdey_application:openURL:sourceApplication:annotation:));
    SwizzlingMethod([AppDelegate class], @selector(applicationDidReceiveMemoryWarning:), @selector(jdey_applicationDidReceiveMemoryWarning:));
    
}

#pragma mark - Method Swizzling
- (BOOL)jdey_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //异步调用第三方注册方法
        
    });
    
    return [self jdey_application:application didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)jdey_application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    //
    
    return [self jdey_application:application handleOpenURL:url];
}

- (BOOL)jdey_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //
    
    return [self jdey_application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

-  (void)jdey_applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    //
    
    [self jdey_applicationDidReceiveMemoryWarning:application];
}

#pragma mark
#pragma mark Other Action

@end
