//
//  PrototypePattern.m
//  DesignPatternDemo
//
//      
//  
//

#import "PrototypePattern.h"

@implementation ConcreteProduct

- (NSString *)name{
    return @"啤酒";
}
- (id<IProduct>)clone{
    ConcreteProduct *product = [[ConcreteProduct alloc]init];
    product.name = self.name;
    return product;
}

@synthesize name;

@end

@implementation Client

- (id<IProduct>)operation{
    return self.prototype.clone;
}

@end
