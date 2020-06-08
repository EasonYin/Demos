//
//  FlyweightCircle.h
//  DesignPatternDemo
//
//        .
//  
//

#import <Foundation/Foundation.h>
#import "FlyweightShape.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlyweightCircle : NSObject<FlyweightShape>

- (FlyweightCircle *)initWithColor:(NSString *)color;

- (void)setX:(int)x;
- (void)setY:(int)y;
- (void)setRadius:(int)radius;

@end

NS_ASSUME_NONNULL_END
