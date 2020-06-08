//
//  CompositeEmployee.m
//  DesignPatternDemo
//
//       
//  
//

#import "CompositeEmployee.h"

@interface CompositeEmployee ()

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *dept;
@property (nonatomic,assign) int salary;
@property (nonatomic,strong) NSMutableArray *subordinates;

@end

@implementation CompositeEmployee

- (NSMutableArray *)subordinates
{
    if (!_subordinates) {
        _subordinates = [NSMutableArray array];
    }
    return _subordinates;
}

+ (CompositeEmployee *)creatEmployeeWithName:(NSString *)name dept:(NSString *)dept salary:(int)salary
{
    CompositeEmployee *employee = [[CompositeEmployee alloc]init];
    employee.name = name;
    employee.dept = dept;
    employee.salary = salary;
    
    return employee;
}

- (void)addEmployee:(CompositeEmployee *)e
{
    if (![self.subordinates containsObject:e]) {
        [self.subordinates addObject:e];
    }
}

- (void)removeEmployee:(CompositeEmployee *)e
{
    if ([self.subordinates containsObject:e]) {
        [self.subordinates removeObject:e];
    }
}

- (NSArray *)getSubordinates
{
    return self.subordinates;
}

- (NSString *)description
{
    //Employee :[ Name : John, dept : CEO, salary :30000 ]
    NSString *showMessage = [NSString stringWithFormat:@"%@:[name:%@ ,dept:%@ ,salary:%d]",[super description],self.name,self.dept,self.salary];
    return showMessage;
}

@end
