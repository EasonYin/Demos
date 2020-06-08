//
//  FilterCriteria.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "FilterPerson.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FilterCriteria <NSObject>

- (NSArray<FilterPerson *> *)meetCriteria:(NSArray<FilterPerson *> *)persons;

@end

NS_ASSUME_NONNULL_END
