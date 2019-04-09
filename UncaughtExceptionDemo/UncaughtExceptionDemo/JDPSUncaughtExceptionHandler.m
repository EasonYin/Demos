//
//  JDPSUncaughtExceptionHandler.m
//  JDPSAppModule_Example
//
//  Created by 尹华东 on 2018/8/22.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "JDPSUncaughtExceptionHandler.h"

#include <libkern/OSAtomic.h>
#include <execinfo.h>

NSString *const UncaughtExceptionHandlerSignalExceptionName =@"UncaughtExceptionHandlerSignalExceptionName";
NSString *const UncaughtExceptionHandlerSignalKey =@"UncaughtExceptionHandlerSignalKey";
NSString *const UncaughtExceptionHandlerAddressesKey =@"UncaughtExceptionHandlerAddressesKey";

volatile int32_t UncaughtExceptionCount =0;
const int32_t UncaughtExceptionMaximum =10;

const NSInteger UncaughtExceptionHandlerSkipAddressCount =4;
const NSInteger UncaughtExceptionHandlerReportAddressCount =5;

@implementation JDPSUncaughtExceptionHandler

// 程序崩溃2(程序崩溃第二步走的方法)
+(NSArray *)backtrace {
    void *callstack[128];
    int frames =backtrace(callstack, 128);
    char **strs =backtrace_symbols(callstack, frames);
    int i;
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for (i = UncaughtExceptionHandlerSkipAddressCount ; i <UncaughtExceptionHandlerSkipAddressCount +UncaughtExceptionHandlerReportAddressCount; i++){
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
    return backtrace;
}
-(void)alertView:(UIAlertController *)anAlertView clickedButtonAtIndex:(NSInteger)anIndex {
    if (anIndex ==0){
        dismissed =YES;
    }else if (anIndex==1) {
        NSLog(@"ssssssss");
    }
}
-(void)validateAndSaveCriticalApplicationData {
    // 崩溃拦截可以做的事,写在这个方法也是极好的
}
// 程序崩溃3(程序崩溃是第三进入的方法)
-(void)handleException:(NSException *)exception {
    [self validateAndSaveCriticalApplicationData];
    //这里可以打印或者显示出ERROR的原因.
     NSString *message = [NSString stringWithFormat:NSLocalizedString(@"如果点击继续，程序有可能会出现其他的问题，建议您还是点击退出按钮并重新打开"@"异常原因如下:\n%@\n%@",nil),[exception reason],[[exception userInfo] objectForKey:UncaughtExceptionHandlerAddressesKey]];
    
    //设置弹出框来了提醒用户, 当然也可以是自己设计其他内容,
//    NSString *message = [NSString stringWithFormat:NSLocalizedString(@"如果点击继续，程序有可能会出现其他的问题，建议您还是点击退出按钮并重新打开",nil)];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"抱歉，程序出现了异常",nil)
                                                                   message:message
                                                            preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"继续",nil) style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        [[[UIApplication sharedApplication]keyWindow].rootViewController dismissViewControllerAnimated:alert completion:nil];

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"退出",nil) style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIApplication sharedApplication]keyWindow].rootViewController presentViewController:alert animated:YES completion:nil];
    });
    
    // 利用RunLoop , 来完成拦截的操作
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
    
    while (!dismissed) {
        for (NSString *mode in (__bridge NSArray *)allModes) {
            CFRunLoopRunInMode((CFStringRef)mode,0.001, false);
        }
    }
    
    CFRelease(allModes);
    NSSetUncaughtExceptionHandler(NULL);
    signal(SIGABRT,SIG_DFL);
    signal(SIGILL,SIG_DFL);
    signal(SIGSEGV,SIG_DFL);
    signal(SIGFPE,SIG_DFL);
    signal(SIGBUS,SIG_DFL);
    signal(SIGPIPE,SIG_DFL);
    
    [exception raise];
    if ([[exception name] isEqual:UncaughtExceptionHandlerSignalExceptionName]) {
        kill(getpid(), [[[exception userInfo] objectForKey:UncaughtExceptionHandlerSignalKey]intValue]);
    }else{
        [exception raise];
    }
}

@end

// 程序崩溃时1(程序崩溃是首先进入的方法, 你可以debug自己调试)
void HandleException(NSException *exception) {
    int32_t exceptionCount =OSAtomicIncrement32(&UncaughtExceptionCount);
    if (exceptionCount >UncaughtExceptionMaximum) {
        return;
    }
    
    NSArray *callStack = [JDPSUncaughtExceptionHandler backtrace];
    NSMutableDictionary *userInfo =[NSMutableDictionary dictionaryWithDictionary:[exception userInfo]];[userInfo setObject:callStack forKey:UncaughtExceptionHandlerAddressesKey];
    
    [[[JDPSUncaughtExceptionHandler alloc] init]performSelectorOnMainThread:@selector(handleException:)withObject:
     [NSException exceptionWithName:[exception name] reason:[exception reason] userInfo:userInfo]waitUntilDone:YES];
}

void SignalHandler(int signal) {
    int32_t exceptionCount =OSAtomicIncrement32(&UncaughtExceptionCount);
    if (exceptionCount >UncaughtExceptionMaximum) {
        return;
    }
    
    NSMutableDictionary *userInfo =[NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UncaughtExceptionHandlerSignalKey];
    
    NSArray *callStack = [JDPSUncaughtExceptionHandler backtrace];
    [userInfo setObject:callStack forKey:UncaughtExceptionHandlerAddressesKey];
    
    [[[JDPSUncaughtExceptionHandler alloc] init] performSelectorOnMainThread:@selector(handleException:)withObject:[NSException exceptionWithName:UncaughtExceptionHandlerSignalExceptionName reason:[NSString stringWithFormat:NSLocalizedString(@"Signal %d was raised.",nil),signal]userInfo:
                                                                                                                [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:signal]forKey:UncaughtExceptionHandlerSignalKey]]waitUntilDone:YES];
}

//. 进入程序时(在AppDelegate.m)里添加那行代码后,就会启用这行代码了
void InstallUncaughtExceptionHandler(void) {
    
    NSSetUncaughtExceptionHandler(&HandleException);
    
    signal(SIGHUP, SignalHandler);
    signal(SIGINT, SignalHandler);
    signal(SIGQUIT, SignalHandler);
    
    
    signal(SIGABRT,SignalHandler);
    signal(SIGILL,SignalHandler);
    signal(SIGSEGV,SignalHandler);
    signal(SIGFPE,SignalHandler);
    signal(SIGBUS,SignalHandler);
    signal(SIGPIPE,SignalHandler);
}

