//
//  BridgeShape.m
//  DesignPatternDemo
//
//    
//  
//

#import "BridgeShape.h"

#define AbstractMethodNotImplemented() \
@throw [NSException exceptionWithName:NSInternalInconsistencyException \
reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
userInfo:nil]


@interface BridgeShape ()

@end

@implementation BridgeShape

- (void)Shape:(id<BridgeDrawAPI>)drawAPI{

    self.drawAPI = drawAPI;
    
}

@end
