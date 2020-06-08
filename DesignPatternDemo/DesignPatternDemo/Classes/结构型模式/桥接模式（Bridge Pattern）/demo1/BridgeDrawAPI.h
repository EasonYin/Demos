//
//  BridgeDrawAPI.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BridgeDrawAPI <NSObject>

- (void)drawCircleWithRadius:(int)radius x:(int)x y:(int)y;

@end

NS_ASSUME_NONNULL_END
