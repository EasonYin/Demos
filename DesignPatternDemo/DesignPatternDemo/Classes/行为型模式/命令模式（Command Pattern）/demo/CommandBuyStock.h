//
//  CommandBuyStock.h
//  DesignPatternDemo
//
//   
//  
//

#import <Foundation/Foundation.h>
#import "CommandOrder.h"
#import "CommandStock.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommandBuyStock : CommandOrder
{
    @private
    CommandStock *abcStock;
}

- (instancetype)initWithStock:(CommandStock *)stock;

@end

NS_ASSUME_NONNULL_END
