//
//  JDPSUncaughtExceptionHandler.h
//  JDPSAppModule_Example
//
//  Created by 尹华东 on 2018/8/22.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JDPSUncaughtExceptionHandler : NSObject
{
    BOOL dismissed;
}
@end
void HandleException(NSException *exception);
void SignalHandler(int signal);
void InstallUncaughtExceptionHandler(void);
