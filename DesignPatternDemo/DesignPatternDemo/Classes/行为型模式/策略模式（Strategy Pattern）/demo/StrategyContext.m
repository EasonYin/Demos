//
//  StrategyContext.m
//  DesignPatternDemo
//
//        
//  
//

#import "StrategyContext.h"

@interface StrategyContext ()
@property (nonatomic,strong) Strategy *strategy;
@end
@implementation StrategyContext
- (instancetype)initWithStragery:(Strategy *)strategy
{
    self = [super init];
    if (self) {
        self.strategy = strategy;
    }
    return self;
}

- (int)executeStrategyNum1:(int)num1 Num2:(int)num2
{
    return [self.strategy doOperationNum1:num1 Num2:num2];
}

@end
