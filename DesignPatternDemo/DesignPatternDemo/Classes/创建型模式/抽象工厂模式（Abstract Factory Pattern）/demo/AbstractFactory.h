//
//  AbstractFactory.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Color;
typedef NS_ENUM(NSUInteger, ColorType) {
    ColorTypeGreen,
    ColorTypeBlue,
    ColorTypeNone,
};

@class Shape;
typedef NS_ENUM(NSUInteger, ShapeType) {
    ShapeTypeRectangle,
    ShapeTypeSquare,
    ShapeTypeNone,
};

@interface AbstractFactory : NSObject
- (Color *)getColor:(ColorType)colorType;
- (Shape *)getShape:(ShapeType)shapeType;
@end

NS_ASSUME_NONNULL_END
