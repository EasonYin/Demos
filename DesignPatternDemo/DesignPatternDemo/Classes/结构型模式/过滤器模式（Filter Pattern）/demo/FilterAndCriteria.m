//
//  FilterAndCriteria.m
//  DesignPatternDemo
//
//      
//  
//

#import "FilterAndCriteria.h"

@interface FilterAndCriteria ()
@property (nonatomic,strong,readwrite) id<FilterCriteria> criteria;
@property (nonatomic,strong,readwrite) id<FilterCriteria> otherCriteria;
@end

@implementation FilterAndCriteria

- (instancetype)initAndCriteriaWithCriteria:(id<FilterCriteria>)criteria OtherCriteria:(id<FilterCriteria>)otherCriteria
{
    if (self == [super init]) {
        self.criteria = criteria;
        self.otherCriteria = otherCriteria;
    }
    return self;
}

- (NSArray<FilterPerson *> *)meetCriteria:(NSArray<FilterPerson *> *)persons{
    NSArray *firstCriteriaPersons = [self.criteria meetCriteria:persons];
    return [self.otherCriteria meetCriteria:firstCriteriaPersons];
}

@end
