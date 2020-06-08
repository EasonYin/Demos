//
//  ObserverNotification.m
//  DesignPatternDemo
//
//        
//  
//

#import "ObserverNotification.h"

@implementation ObserverNotification

- (void)post
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ObserverNotification" object:@"testNoti"];
}

@end
