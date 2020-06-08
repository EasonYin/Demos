//
//  FlyweightShapeFactory.h
//  DesignPatternDemo
//
//        .
//  
//

#import <Foundation/Foundation.h>
#import "FlyweightCircle.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlyweightShapeFactory : NSObject

+ (FlyweightCircle *)getCircle:(NSString *)color;

@end

NS_ASSUME_NONNULL_END
