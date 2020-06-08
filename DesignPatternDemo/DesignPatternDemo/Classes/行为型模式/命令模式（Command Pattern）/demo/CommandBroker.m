//
//  CommandBroker.m
//  DesignPatternDemo
//
//   
//  
//

#import "CommandBroker.h"

@implementation CommandBroker

- (instancetype)init
{
    self = [super init];
    if (self) {
        orderList = [NSMutableArray array];
    }
    return self;
}

- (void)takeOrder:(CommandOrder *)order
{
    [orderList addObject:order];
}

- (void)placeOrders
{
    for (CommandOrder *order in orderList) {
        [order execute];
    }
    [orderList removeAllObjects];
}

@end
