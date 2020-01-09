//
//  YHDLocalized.h
//  LocalizationsDemo
//
//  Created by 尹华东 on 2020/1/9.
//  Copyright © 2020 EasonY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const AppLanguage = @"myAppLanguage";

@interface YHDLocalized : NSObject

+ (YHDLocalized *)sharedInstance;

//初始化多语言功能
- (void)initLanguage;

//当前语言
- (NSString *)currentLanguage;

//设置要转换的语言
- (void)setLanguage:(NSString *)language;

//设置为系统语言
- (void)systemLanguage;

@end

NS_ASSUME_NONNULL_END
