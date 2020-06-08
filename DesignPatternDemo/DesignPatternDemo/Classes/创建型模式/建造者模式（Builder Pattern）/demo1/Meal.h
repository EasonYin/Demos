//
//  Meal.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "ItemBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface Meal : NSObject

-(void)addFoodItems:(ItemBase*)item;
-(float)getCost;
-(void)showItems;

@end

NS_ASSUME_NONNULL_END
