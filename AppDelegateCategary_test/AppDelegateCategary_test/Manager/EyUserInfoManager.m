//
//  EyUserInfoManager.m
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "EyUserInfoManager.h"

static EyUserInfoManager *staticUserDataManager;

@implementation EyUserInfoManager

+ (instancetype)sharedManager
{
    if (!staticUserDataManager){
        static dispatch_once_t token ;
        dispatch_once(&token, ^{
            staticUserDataManager = [[EyUserInfoManager alloc] init];
        });
    }
    return staticUserDataManager;
}

-(instancetype)init{
    self = [super init];
    if (self){
        //初始化,从本地数据获得
        self.userName           = @"test";
        self.userPassword       = @"123";
        self.showLaunchView     = YES;
        self.showPrivateView    = YES;
    }
    return self;
}

- (BOOL)isUserLogin{
    
    if (!([EyUserInfoManager sharedManager].userName != nil &&
          [EyUserInfoManager sharedManager].userName.length > 0 &&
          [EyUserInfoManager sharedManager].userPassword != nil &&
          [EyUserInfoManager sharedManager].userPassword.length > 0)) {
        
        return NO;
    }
    
    return YES;
}

-(BOOL)userLogOut{
    
    self.userName           = @"";
    self.userPassword       = @"";
    self.showLaunchView     = NO;
    self.showPrivateView    = NO;

    if (!([EyUserInfoManager sharedManager].userName != nil &&
          [EyUserInfoManager sharedManager].userName.length > 0 &&
          [EyUserInfoManager sharedManager].userPassword != nil &&
          [EyUserInfoManager sharedManager].userPassword.length > 0)) {
        
        return YES;
    }
    return NO;
}

@end
