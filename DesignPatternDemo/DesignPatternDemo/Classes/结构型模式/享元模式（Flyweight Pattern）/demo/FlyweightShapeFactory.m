//
//  FlyweightShapeFactory.m
//  DesignPatternDemo
//
//        .
//  
//

#import "FlyweightShapeFactory.h"

static NSMutableDictionary *circleMap = nil;

@implementation FlyweightShapeFactory

+ (FlyweightCircle *)getCircle:(NSString *)color
{
    if (!circleMap) {
        circleMap = [NSMutableDictionary dictionary];
    }
    
    FlyweightCircle *circle = (FlyweightCircle *)[circleMap objectForKey:color];
    if (!circle) {
        circle = [[FlyweightCircle alloc]initWithColor:color];
        [circleMap setObject:circle forKey:color];
        NSLog(@"Creating circle of color : %@",color);
    }
    return circle;
}


@end
