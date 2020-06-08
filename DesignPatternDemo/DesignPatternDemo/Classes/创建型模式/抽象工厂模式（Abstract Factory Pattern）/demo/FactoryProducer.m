//
//  FactoryProducer.m
//  DesignPatternDemo
//
//

#import "FactoryProducer.h"

@implementation FactoryProducer
+ (AbstractFactory *)getFactory:(FactoryType)factoryType{
    switch (factoryType) {
        case FactoryTypeShape:
            return [ShapeFactory2Ab new];
            break;
        case FactoryTypeColor:
            return [ColorFactory new];
            break;
        default:
            return [AbstractFactory new];
            break;
    }
}
@end
