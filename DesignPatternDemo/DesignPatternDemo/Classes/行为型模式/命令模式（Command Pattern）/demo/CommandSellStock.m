//
//  CommandSellStock.m
//  DesignPatternDemo
//
//   
//  
//

#import "CommandSellStock.h"

@implementation CommandSellStock

- (instancetype)initWithStock:(CommandStock *)stock
{
    self = [super init];
    if (self) {
        abcStock = stock;
    }
    return self;
}

- (void)execute
{
    [abcStock sell];
}

@end
