//
//  BridgeRemote.m
//  DesignPatternDemo
//
//      
//  
//

#import "BridgeRemote.h"

@implementation BridgeRemote
- (void)setCommand:(NSString *)command {
    
    [self.airConditioner loadCommand:command];
}
@end
