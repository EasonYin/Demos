//
//  FlyweightCircle.m
//  DesignPatternDemo
//
//        .
//  
//

#import "FlyweightCircle.h"

@interface FlyweightCircle ()

@property (nonatomic,copy) NSString *color;
@property (nonatomic,assign) int x;
@property (nonatomic,assign) int y;
@property (nonatomic,assign) int radius;

@end

@implementation FlyweightCircle

- (FlyweightCircle *)initWithColor:(NSString *)color
{
    self = [super init];
    if (self) {
        _color = color;
    }
    return self;
}

- (void)setX:(int)x
{
    _x = x;
}

- (void)setY:(int)y
{
    _y = y;
}

- (void)setRadius:(int)radius
{
    _radius = radius;
}

- (void)draw
{
    NSString *showString = [NSString stringWithFormat:@"Circle: Draw() [Color : %@ , x : %d , y : %d, radius : %d",self.color,self.x,self.y,self.radius];
    NSLog(@"%@",showString);
}

@end
