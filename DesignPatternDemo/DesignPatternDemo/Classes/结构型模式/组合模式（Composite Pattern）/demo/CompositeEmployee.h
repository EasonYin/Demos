//
//  CompositeEmployee.h
//  DesignPatternDemo
//
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CompositeEmployee : NSObject

+ (CompositeEmployee *)creatEmployeeWithName:(NSString *)name dept:(NSString *)dept salary:(int)salary;

- (void)addEmployee:(CompositeEmployee *)e;
- (void)removeEmployee:(CompositeEmployee *)e;

- (NSArray *)getSubordinates;

@end

NS_ASSUME_NONNULL_END
