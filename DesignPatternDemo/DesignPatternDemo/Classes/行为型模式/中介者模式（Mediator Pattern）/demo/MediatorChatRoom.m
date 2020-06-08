//
//  MediatorChatRoom.m
//  DesignPatternDemo
//
//        
//  
//

#import "MediatorChatRoom.h"

@implementation MediatorChatRoom

+ (void)showMessage:(NSString *)message user:(MediatorUser *)user
{
    NSLog(@"%@ [%@] : %@",[NSDate date],user.name,message);
}

@end
