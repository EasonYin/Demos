//
//  FilterCriteriaFemale.m
//  DesignPatternDemo
//
//      
//  
//

#import "FilterCriteriaFemale.h"

@implementation FilterCriteriaFemale
- (NSArray<FilterPerson *> *)meetCriteria:(NSArray<FilterPerson *> *)persons{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (FilterPerson *obj in persons) {
        if ([obj.gender isEqualToString:@"Female"]) {
            [tempArray addObject:obj];
        }
    }
    return tempArray;
}
@end
