//
//  DecoratorShapeDecorator.h
//  DesignPatternDemo
//
//        .
//  
//

#import <Foundation/Foundation.h>
#import "DecoratorShape.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DecoratorShape;

@interface DecoratorShapeDecorator : NSObject

@property (nonatomic,weak) id<DecoratorShape> decoratedShape;

- (void)draw;

@end

NS_ASSUME_NONNULL_END
