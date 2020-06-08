//
//  Meal.m
//  DesignPatternDemo
//
//      
//  
//

#import "Meal.h"

@interface Meal()
@property(nonatomic,copy)NSMutableArray<ItemBase *> *items;
@end

@implementation Meal
-(instancetype)init{
    if (self == [super init]) {
        _items = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)addFoodItems:(ItemBase*)item{
    [_items addObject:item];
}
-(float)getCost{
    float cost = 0.0f;
    for (int i = 0; i < _items.count; i++) {
        cost += _items[i].price;
    }
    return cost;
}
-(void)showItems{
    for (int i = 0; i < _items.count; i++) {
        NSLog(@"name:%@,Packing:%@,price:%@",_items[i].name,_items[i].packing,[NSNumber numberWithDouble:_items[i].price]);
    }
}
@end
