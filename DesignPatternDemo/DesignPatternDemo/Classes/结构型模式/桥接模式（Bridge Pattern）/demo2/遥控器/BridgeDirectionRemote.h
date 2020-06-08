//
//  BridgeDirectionRemote.h
//  DesignPatternDemo
//
//      
//  
//

#import "BridgeRemote.h"

NS_ASSUME_NONNULL_BEGIN

@interface BridgeDirectionRemote : BridgeRemote
- (void)up;

- (void)down;

- (void)left;

- (void)right;
@end

NS_ASSUME_NONNULL_END
