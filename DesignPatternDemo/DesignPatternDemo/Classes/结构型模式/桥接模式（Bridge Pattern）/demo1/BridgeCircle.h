//
//  BridgeCircle.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>
#import "BridgeShape.h"

NS_ASSUME_NONNULL_BEGIN

@interface BridgeCircle : BridgeShape

- (void)CircleWithDrawAPI:(id<BridgeDrawAPI>)drawAPI radius:(int)radius x:(int)x y:(int)y;

@end

NS_ASSUME_NONNULL_END
