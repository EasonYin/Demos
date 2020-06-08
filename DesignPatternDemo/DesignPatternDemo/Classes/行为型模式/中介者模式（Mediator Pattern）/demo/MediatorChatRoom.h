//
//  MediatorChatRoom.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "MediatorUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface MediatorChatRoom : NSObject

+ (void)showMessage:(NSString *)message user:(MediatorUser *)user;

@end

NS_ASSUME_NONNULL_END
