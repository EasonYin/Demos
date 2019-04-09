//
//  AppDelegate+Method.m
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "AppDelegate+Method.h"

@implementation AppDelegate (Method)

+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (void)closeKeyWindow
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

@end
