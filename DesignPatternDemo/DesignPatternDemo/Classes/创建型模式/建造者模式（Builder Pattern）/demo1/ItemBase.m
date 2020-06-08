//
//  ItemBase.m
//  DesignPatternDemo
//
//      
//  
//

#import "ItemBase.h"

@implementation ItemBase
- (id<Packing>)packing{
    return nil;
}

@synthesize name;

@synthesize packing;

@synthesize price;

@end

#pragma mark - Bugger
@implementation Bugger

- (id<Packing>)packing{
    return [Wrapper new];
}

@end

@implementation VegBurger

-(float)price{
    return 25.0;
}
-(NSString *)name{
    return @"Bugger";
}

@end

@implementation ChickenBurger

-(float)price{
    return 50.5;
}
-(NSString *)name{
    return @"ChickenBurger";
}
@end

#pragma mark - ColdDrink
@implementation ColdDrink
- (id<Packing>)packing{
    return [Bottle new];
}

@end

@implementation Coke
-(float)price{
    return 30.0;
}
-(NSString *)name{
    return @"Coke";
}
@end

@implementation Pepsi
-(float)price{
    return 35.0;
}
-(NSString *)name{
    return @"Pepsi";
}
@end
