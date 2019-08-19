//
//  ViewController.m
//  InvocationDemo
//
//  Created by 尹华东 on 2019/8/19.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+EYInvocation.h"

static BOOL isEqualToString(NSString *obj1, NSString *obj2)
{
    if (!obj1 || !obj2)
    {
        return NO;
    }
    if (![obj1 isKindOfClass:[NSString class]] || ![obj2 isKindOfClass:[NSString class]])
    {
        return NO;
    }
    
    return [obj1 isEqualToString:obj2];
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(test1:) withObjects:@[@"测试字符串1"]];
    NSString *testResult = [self performSelector:@selector(test2:appendString:) withObjects:@[@"测试字符串2",@"测试字符串3"]];
    NSLog(@"testResult:%@",testResult);
    
}

- (void)test1:(NSString *)str1{
    NSLog(@"test1:%@",str1);
}

- (NSString *)test2:(NSString *)str1 appendString:(NSString*)str2{
    NSString *result = [str1 stringByAppendingString:str2];
    NSLog(@"test2:str1=%@,str2=%@,string=%@",str1,str2,result);
    return result;
}

@end
