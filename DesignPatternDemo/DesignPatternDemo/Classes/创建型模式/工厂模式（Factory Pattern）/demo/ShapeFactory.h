//
//  ShapeFactory.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>
#import "Shape.h"
#import "Rectangle.h"
#import "Square.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ShapeType) {
    ShapeTypeRectangle,
    ShapeTypeSquare,
    ShapeTypeNone,
};
@interface ShapeFactory : NSObject
- (Shape *)getShape:(ShapeType)shapeType;
@end

NS_ASSUME_NONNULL_END
