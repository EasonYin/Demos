//
//  CommandStock.m
//  DesignPatternDemo
//
//   
//  
//

#import "CommandStock.h"

@implementation CommandStock

- (instancetype)init
{
    self = [super init];
    if (self) {
        name = @"ABC";
        quantity = 10;
    }
    return self;
}

- (void)buy
{
    NSLog(@"Stock [ Name: %@, Quantity: %d] bought",name,quantity);
}

- (void)sell
{
    NSLog(@"Stock [ Name: %@, Quantity: %d] sold",name,quantity);
}

@end
