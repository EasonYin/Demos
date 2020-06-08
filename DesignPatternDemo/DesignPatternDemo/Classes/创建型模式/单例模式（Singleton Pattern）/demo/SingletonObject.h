//
//  SingletonObject.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingletonObject : NSObject

+ (instancetype)shareObject;

@end

NS_ASSUME_NONNULL_END
