//
//  AppDelegate+Method.h
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Method)

/*!
 @brief 全局appDeleaget
 */
+ (AppDelegate *)appDelegate;

/*!
 @method
 @brief 关闭系统键盘
 */
+ (void)closeKeyWindow;

@end
