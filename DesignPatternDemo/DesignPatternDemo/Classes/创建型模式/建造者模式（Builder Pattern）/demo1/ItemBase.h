//
//  ItemBase.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "PackingType.h"
#import "ItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@interface ItemBase : NSObject<Item>

@end

#pragma mark - Bugger
@interface Bugger : ItemBase

@end

@interface VegBurger : Bugger

@end

@interface ChickenBurger : Bugger

@end

#pragma mark - ColdDrink
@interface ColdDrink : ItemBase

@end

@interface Coke : ColdDrink

@end

@interface Pepsi : ColdDrink

@end

NS_ASSUME_NONNULL_END
