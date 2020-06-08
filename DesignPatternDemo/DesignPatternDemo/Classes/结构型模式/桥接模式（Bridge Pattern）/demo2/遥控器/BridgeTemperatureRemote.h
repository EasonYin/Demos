//
//  BridgeTemperatureRemote.h
//  DesignPatternDemo
//
//      
//  
//

#import "BridgeRemote.h"

NS_ASSUME_NONNULL_BEGIN

@interface BridgeTemperatureRemote : BridgeRemote
- (void)warmer;

- (void)colder;
@end

NS_ASSUME_NONNULL_END
