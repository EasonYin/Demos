//
//  YHDLocalized.m
//  LocalizationsDemo
//
//  Created by 尹华东 on 2020/1/9.
//  Copyright © 2020 EasonY. All rights reserved.
//

#import "YHDLocalized.h"
#import "NSBundle+language.h"

@implementation YHDLocalized

+ (YHDLocalized *)sharedInstance {
    static YHDLocalized *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YHDLocalized alloc] init];
    });
    return instance;
}

- (void)initLanguage{
    NSString *language=[self currentLanguage];
    if (language.length>0) {
        NSLog(@"自设置语言:%@",language);
        [self setLanguage:language];
    }else{
        [self systemLanguage];
    }
}

- (NSString *)currentLanguage{
    NSString *language=[[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage];
    return language;
}

- (void)systemLanguage{
    NSArray *langArr = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSString *languageCode = langArr.firstObject;
    NSLog(@"系统语言:%@",languageCode);
    if([languageCode hasPrefix:@"zh-Hans"]){
        languageCode = @"zh-Hans";//简体中文
    }else if([languageCode hasPrefix:@"en"]){
        languageCode = @"en";//英语
    }
    [self setLanguage:languageCode];
}

- (void)setLanguage:(NSString *)language{
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:AppLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [NSBundle setLanguage:language];
}

@end
