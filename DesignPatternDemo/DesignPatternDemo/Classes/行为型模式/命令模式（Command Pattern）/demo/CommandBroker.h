//
//  CommandBroker.h
//  DesignPatternDemo
//
//   
//  
//

#import <Foundation/Foundation.h>
#import "CommandOrder.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommandBroker : NSObject
{
    @private
    NSMutableArray *orderList;
}

- (void)takeOrder:(CommandOrder *)order;

- (void)placeOrders;

@end

NS_ASSUME_NONNULL_END
