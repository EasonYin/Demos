//
//  PackingType.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "ItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Wrapper : NSObject<Packing>

@end

@interface Bottle : NSObject<Packing>

@end

NS_ASSUME_NONNULL_END
