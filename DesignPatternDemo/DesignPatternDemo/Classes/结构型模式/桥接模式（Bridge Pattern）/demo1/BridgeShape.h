//
//  BridgeShape.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>
#import "BridgeDrawAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface BridgeShape : NSObject

@property (nonatomic,strong) id<BridgeDrawAPI> drawAPI;

- (void)Shape:(id<BridgeDrawAPI>)drawAPI;

@end

@interface BridgeShape (abstract)

- (void)draw;

@end

NS_ASSUME_NONNULL_END
