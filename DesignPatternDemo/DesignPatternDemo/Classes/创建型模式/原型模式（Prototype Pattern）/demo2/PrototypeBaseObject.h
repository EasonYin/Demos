//
//  PrototypeBaseObject.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PrototypeBaseObject : NSObject<NSCopying>

//子类实现
- (void)copyOperationWithObject:(id)object;

@end

NS_ASSUME_NONNULL_END
