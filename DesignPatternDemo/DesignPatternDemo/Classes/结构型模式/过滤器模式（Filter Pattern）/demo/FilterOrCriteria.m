//
//  FilterOrCriteria.m
//  DesignPatternDemo
//
//      
//  
//

#import "FilterOrCriteria.h"

@interface FilterOrCriteria ()
@property (nonatomic,strong,readwrite) id<FilterCriteria> criteria;
@property (nonatomic,strong,readwrite) id<FilterCriteria> otherCriteria;
@end

@implementation FilterOrCriteria

- (instancetype)initOrCriteriaWithCriteria:(id<FilterCriteria>)criteria OtherCriteria:(id<FilterCriteria>)otherCriteria
{
    if (self == [super init]) {
        self.criteria = criteria;
        self.otherCriteria = otherCriteria;
    }
    return self;
}

- (NSArray<FilterPerson *> *)meetCriteria:(NSArray<FilterPerson *> *)persons{
    
    NSMutableArray *firstCriteriaItems = [self.criteria meetCriteria:persons].mutableCopy;
    NSArray *otherCriteriaItems = [self.otherCriteria meetCriteria:persons];
    
    for (FilterPerson *obj in otherCriteriaItems) {
        if (![firstCriteriaItems containsObject:obj]) {
            [firstCriteriaItems addObject:obj];
        }
    }
    
    return firstCriteriaItems;
}

@end
