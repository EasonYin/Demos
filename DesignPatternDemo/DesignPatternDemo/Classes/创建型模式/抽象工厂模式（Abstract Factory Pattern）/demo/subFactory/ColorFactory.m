//
//  ColorFactory.m
//  DesignPatternDemo
//
//

#import "ColorFactory.h"

@implementation ColorFactory
- (Color *)getColor:(ColorType)colorType{
    switch (colorType) {
        case ColorTypeGreen:
        {
            return [Green new];
        }
            break;
        default:
        {
            return [Color new];
        }
            break;
    }
}
@end
