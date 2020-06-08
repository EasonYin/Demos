//
//  BridgeTemperatureRemote.m
//  DesignPatternDemo
//
//      
//  
//

#import "BridgeTemperatureRemote.h"

@implementation BridgeTemperatureRemote
- (void)warmer {
    [super setCommand:@"warmer"];
}

- (void)colder {
    [super setCommand:@"colder"];
}
@end
