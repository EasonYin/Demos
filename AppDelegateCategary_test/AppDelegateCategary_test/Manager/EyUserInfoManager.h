//
//  EyUserInfoManager.h
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EyUserInfoManager : NSObject

@property (nonatomic, assign) BOOL showLaunchView;
@property (nonatomic, assign) BOOL showPrivateView;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;

+ (instancetype)sharedManager;

- (BOOL)isUserLogin;
- (BOOL)userLogOut;

@end
