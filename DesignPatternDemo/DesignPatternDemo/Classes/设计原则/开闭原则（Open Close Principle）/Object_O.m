//
//  Object_O.m
//  DesignPatternDemo
//
//

#import "Object_O.h"

@implementation PayHelper

- (instancetype)init{
    if (self == [super init]) {
        
    }
    return self;
}

- (void)pay:(PaySendModel *)model{
    
    NSString *handerClassName = model.info;
    Class handerClass = NSClassFromString(handerClassName);
    self.processors = [[handerClass alloc] init];
    [self.processors handle:model];
    
}

@end

@implementation PaySendModel

@end

@implementation AliPayProcessor

- (void)handle:(PaySendModel *)model{
    NSLog(@"You choose AliPay!");
}

@end

@implementation WeChatPayProcessor

- (void)handle:(PaySendModel *)model{
    NSLog(@"You choose WeChatPay!");
}

@end

