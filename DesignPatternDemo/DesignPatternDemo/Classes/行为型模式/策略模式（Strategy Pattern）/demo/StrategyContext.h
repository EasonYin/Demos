//
//  StrategyContext.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "Strategy.h"

NS_ASSUME_NONNULL_BEGIN

@interface StrategyContext : NSObject
- (instancetype)initWithStragery:(Strategy *)strategy;
- (int)executeStrategyNum1:(int)num1 Num2:(int)num2;
@end

NS_ASSUME_NONNULL_END
