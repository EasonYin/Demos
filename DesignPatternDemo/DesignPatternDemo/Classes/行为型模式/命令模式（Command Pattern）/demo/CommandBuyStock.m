//
//  CommandBuyStock.m
//  DesignPatternDemo
//
//   
//  
//

#import "CommandBuyStock.h"

@implementation CommandBuyStock

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
    [abcStock buy];
}

@end
