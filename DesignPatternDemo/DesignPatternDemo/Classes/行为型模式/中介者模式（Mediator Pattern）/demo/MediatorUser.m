//
//  MediatorUser.m
//  DesignPatternDemo
//
//        
//  
//

#import "MediatorUser.h"
#import "MediatorChatRoom.h"

@implementation MediatorUser

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void)sendMessage:(NSString *)message
{
    [MediatorChatRoom showMessage:message user:self];
}

@end
