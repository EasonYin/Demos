//
//  FilterOrCriteria.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "FilterCriteria.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterOrCriteria : NSObject<FilterCriteria>

@property (nonatomic,strong,readonly) id<FilterCriteria> criteria;
@property (nonatomic,strong,readonly) id<FilterCriteria> otherCriteria;

- (instancetype)initOrCriteriaWithCriteria:(id<FilterCriteria>)criteria OtherCriteria:(id<FilterCriteria>)otherCriteria;

@end

NS_ASSUME_NONNULL_END
