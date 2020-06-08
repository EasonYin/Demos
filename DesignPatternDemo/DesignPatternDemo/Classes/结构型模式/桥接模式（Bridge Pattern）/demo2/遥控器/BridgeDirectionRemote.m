//
//  BridgeDirectionRemote.m
//  DesignPatternDemo
//
//      
//  
//

#import "BridgeDirectionRemote.h"

@implementation BridgeDirectionRemote
- (void)up {
    [super setCommand:@"up"];
}

- (void)down {
    
    [super setCommand:@"down"];
}

- (void)left {
    
    [super setCommand:@"left"];
}

- (void)right {
    [super setCommand:@"right"];
}
@end
