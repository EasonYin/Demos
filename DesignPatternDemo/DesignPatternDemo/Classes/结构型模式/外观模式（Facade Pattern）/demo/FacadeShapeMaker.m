//
//  FacadeShapeMaker.m
//  DesignPatternDemo
//
//        .
//  
//

#import "FacadeShapeMaker.h"
#import "FacadeRectangle.h"
#import "FacadeSquare.h"
#import "FacadeCircle.h"

@interface FacadeShapeMaker ()
{
    FacadeCircle *_circle;
    FacadeRectangle *_rectangle;
    FacadeSquare *_square;
}
@end

@implementation FacadeShapeMaker
- (instancetype)init
{
    self = [super init];
    if (self) {
        _circle = [[FacadeCircle alloc]init];
        _rectangle = [[FacadeRectangle alloc]init];
        _square = [[FacadeSquare alloc]init];
    }
    return self;
}

- (void)drawCircle
{
    [_circle draw];
}

- (void)drawRectagnle
{
    [_rectangle draw];
}

- (void)drawSquare
{
    [_square draw];
}
@end
