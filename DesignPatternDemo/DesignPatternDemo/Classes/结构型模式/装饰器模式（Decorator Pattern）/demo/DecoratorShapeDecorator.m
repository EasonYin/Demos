//
//  DecoratorShapeDecorator.m
//  DesignPatternDemo
//
//        .
//  
//

#import "DecoratorShapeDecorator.h"

@implementation DecoratorShapeDecorator

- (void)draw
{
    if (self.decoratedShape)
    {
        [self.decoratedShape draw];
    }
}

@end
