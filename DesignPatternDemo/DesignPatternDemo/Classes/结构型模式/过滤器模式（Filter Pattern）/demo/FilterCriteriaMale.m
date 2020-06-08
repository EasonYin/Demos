//
//  FilterCriteriaMale.m
//  DesignPatternDemo
//
//      
//  
//

#import "FilterCriteriaMale.h"

@implementation FilterCriteriaMale
- (NSArray<FilterPerson *> *)meetCriteria:(NSArray<FilterPerson *> *)persons{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (FilterPerson *obj in persons) {
        if ([obj.gender isEqualToString:@"Male"]) {
            [tempArray addObject:obj];
        }
    }
    return tempArray;
}
@end
