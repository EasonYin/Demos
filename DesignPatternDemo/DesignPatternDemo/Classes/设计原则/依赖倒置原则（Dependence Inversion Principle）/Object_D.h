//
//  Object_D.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IGasoline : NSObject
@property (nonatomic,strong) NSString *name;
@end

@interface Gasoline90 : IGasoline

@end

@interface Gasoline93 : IGasoline

@end

@interface Object_DCar : NSObject
- (void)refuel:(IGasoline *)gaso;
@end

NS_ASSUME_NONNULL_END
