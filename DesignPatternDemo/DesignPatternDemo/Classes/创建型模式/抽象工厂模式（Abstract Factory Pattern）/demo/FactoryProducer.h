//
//  FactoryProducer.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>
#import "AbstractFactory.h"
#import "ShapeFactory2Ab.h"
#import "ColorFactory.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FactoryType) {
    FactoryTypeShape,
    FactoryTypeColor,
    FactoryTypeNone,
};
@interface FactoryProducer : NSObject
+ (AbstractFactory *)getFactory:(FactoryType)factoryType;
@end

NS_ASSUME_NONNULL_END
