//
//  ShapeFactory2Ab.m
//  DesignPatternDemo
//
//

#import "ShapeFactory2Ab.h"

@implementation ShapeFactory2Ab
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
