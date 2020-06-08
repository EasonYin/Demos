//
//  Object_I.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IProfessionalCar <NSObject>//具备一般功能的车

- (void)run;
- (void)showSpeed;

@end

@protocol IEntertainingCar <NSObject>//具备娱乐功能的车

- (void)run;
- (void)showSpeed;
- (void)playMusic;

@end

@interface SangTaNaCar : NSObject<IProfessionalCar>

@end

@interface BaoMaCar : NSObject<IEntertainingCar>

@end

NS_ASSUME_NONNULL_END
