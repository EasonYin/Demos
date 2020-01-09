//
//  NSBundle+language.h
//  LocalizationsDemo
//
//  Created by 尹华东 on 2020/1/8.
//  Copyright © 2020 EasonY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (language)

// 设置语言
+ (void)setLanguage:(NSString *)language;

@end

NS_ASSUME_NONNULL_END
