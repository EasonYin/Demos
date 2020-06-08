//
//  MealBuilder.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "Meal.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealBuilder : NSObject

-(Meal*)prepareVegMeal;
-(Meal*)prepareNonVegMeal;

@end

NS_ASSUME_NONNULL_END
