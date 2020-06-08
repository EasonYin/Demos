//
//  MealBuilder.m
//  DesignPatternDemo
//
//      
//  
//

#import "MealBuilder.h"

@implementation MealBuilder

-(Meal*)prepareVegMeal{
    Meal *meal = [Meal new];
    [meal addFoodItems: [VegBurger new]];
    [meal addFoodItems:[Coke new]];
    return meal;
}

-(Meal*)prepareNonVegMeal{
    Meal *meal = [Meal new];
    [meal addFoodItems: [ChickenBurger new]];
    [meal addFoodItems:[Pepsi new]];
    return meal;
    
}

@end
