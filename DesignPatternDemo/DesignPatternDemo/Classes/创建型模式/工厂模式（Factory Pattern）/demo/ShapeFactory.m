//
//  ShapeFactory.m
//  DesignPatternDemo
//
//

#import "ShapeFactory.h"


@implementation ShapeFactory
- (Shape *)getShape:(ShapeType)shapeType{
    
    switch (shapeType) {
        case ShapeTypeRectangle:
        {
            return [Rectangle new];
        }
            break;
        case ShapeTypeSquare:
        {
            return [Square new];
        }
            break;
        default:
        {
            return [Shape new];
        }
            break;
    }
}
@end
