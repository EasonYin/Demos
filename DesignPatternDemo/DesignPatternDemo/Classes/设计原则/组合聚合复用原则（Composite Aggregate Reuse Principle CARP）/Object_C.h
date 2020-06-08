//
//  Object_C.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Airfoil : NSObject
- (void)adjustAngle;
@end

@interface Plane : NSObject
- (void)fly;
@end

NS_ASSUME_NONNULL_END
