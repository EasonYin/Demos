//
//  CompositePatternViewController.m
//  DesignPatternDemo
//
//      
//  
//

#import "CompositePatternViewController.h"
#import "CompositeEmployee.h"

@interface CompositePatternViewController ()

@end

@implementation CompositePatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CompositeEmployee *CEO = [CompositeEmployee creatEmployeeWithName:@"John" dept:@"CEO" salary:30000];
    
    CompositeEmployee *headSales = [CompositeEmployee creatEmployeeWithName:@"Robert" dept:@"Head Sales" salary:20000];
    CompositeEmployee *headMarketing = [CompositeEmployee creatEmployeeWithName:@"Michel" dept:@"Head Marketing" salary:20000];
    
    CompositeEmployee *clerk1 = [CompositeEmployee creatEmployeeWithName:@"Laura" dept:@"Marketing" salary:10000];
    CompositeEmployee *clerk2 = [CompositeEmployee creatEmployeeWithName:@"Bob" dept:@"Marketing" salary:10000];
    
    CompositeEmployee *salesExecutive1 = [CompositeEmployee creatEmployeeWithName:@"Richard" dept:@"Sales" salary:10000];
    CompositeEmployee *salesExecutive2 = [CompositeEmployee creatEmployeeWithName:@"Rob" dept:@"Sales" salary:10000];
    
    [CEO addEmployee:headSales];
    [CEO addEmployee:headMarketing];
    
    [headSales addEmployee:salesExecutive1];
    [headSales addEmployee:salesExecutive2];
    
    [headMarketing addEmployee:clerk1];
    [headMarketing addEmployee:clerk2];
    
    NSLog(@"%@",CEO.description);
    for (CompositeEmployee *headEmployee in CEO.getSubordinates) {
        NSLog(@"%@",headEmployee);
        for (CompositeEmployee *employee in headEmployee.getSubordinates) {
            NSLog(@"%@",employee);
        }
    }
}


@end
