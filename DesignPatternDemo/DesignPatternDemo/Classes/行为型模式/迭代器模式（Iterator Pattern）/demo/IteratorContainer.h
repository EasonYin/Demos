//
//  IteratorContainer.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "IteratorIterator.h"

NS_ASSUME_NONNULL_BEGIN
@interface IteratorContainer : NSObject

- (IteratorIterator *)getIterator;

@end

NS_ASSUME_NONNULL_END
