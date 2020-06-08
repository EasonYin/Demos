//
//  DecoratorRedShapeDecorator.m
//  DesignPatternDemo
//
//        .
//  
//

#import "DecoratorRedShapeDecorator.h"

@implementation DecoratorRedShapeDecorator

- (void)setRedBorder:(id<DecoratorShape>)decoratedShape
{
    NSLog(@"Border Color: Red");
}

- (void)draw
{
    [super draw];
    
    [self setRedBorder:self.decoratedShape];
}

@end
