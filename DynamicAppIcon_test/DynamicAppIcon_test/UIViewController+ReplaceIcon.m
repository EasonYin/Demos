//
//  UIViewController+ReplaceIcon.m
//  DynamicAppIcon_test
//
//  Created by 尹华东 on 2018/10/25.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "UIViewController+ReplaceIcon.h"
#import <objc/runtime.h>

@implementation UIViewController (ReplaceIcon)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(ey_presentViewController:animated:completion:));
        
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

- (void)ey_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
//        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
//        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);
        
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }
    }
    
    [self ey_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
