//
//  FilterCriteriaSingle.m
//  DesignPatternDemo
//
//      
//  
//

#import "FilterCriteriaSingle.h"

@implementation FilterCriteriaSingle
- (NSArray<FilterPerson *> *)meetCriteria:(NSArray<FilterPerson *> *)persons{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (FilterPerson *obj in persons) {
        if ([obj.maritalStatus isEqualToString:@"Single"]) {
            [tempArray addObject:obj];
        }
    }
    return tempArray;
}
@end
