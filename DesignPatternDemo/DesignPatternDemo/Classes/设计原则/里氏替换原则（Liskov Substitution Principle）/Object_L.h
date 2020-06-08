//
//  Object_L.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Object_LCar : NSObject
- (void)run;
@end

@interface Object_LBaoMaCar : Object_LCar
- (void)showSpeed;
@end

NS_ASSUME_NONNULL_END
