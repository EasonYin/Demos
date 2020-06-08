//
//  FilterPatternViewController.m
//  DesignPatternDemo
//
//      
//  
//

#import "FilterPatternViewController.h"
#import "FilterCriteriaMale.h"
#import "FilterCriteriaFemale.h"
#import "FilterCriteriaSingle.h"
#import "FilterAndCriteria.h"
#import "FilterOrCriteria.h"


@interface FilterPatternViewController ()

@end

@implementation FilterPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *persons = [NSMutableArray array];
    [persons addObject:[[FilterPerson alloc] initPersonWithName:@"Robert" Gender:@"Male" MaritalStatus:@"Single"]];
    [persons addObject:[[FilterPerson alloc] initPersonWithName:@"John" Gender:@"Male" MaritalStatus:@"Married"]];
    [persons addObject:[[FilterPerson alloc] initPersonWithName:@"Laura" Gender:@"Female" MaritalStatus:@"Married"]];
    [persons addObject:[[FilterPerson alloc] initPersonWithName:@"Diana" Gender:@"Female" MaritalStatus:@"Single"]];
    [persons addObject:[[FilterPerson alloc] initPersonWithName:@"Mike" Gender:@"Male" MaritalStatus:@"Single"]];
    [persons addObject:[[FilterPerson alloc] initPersonWithName:@"Bobby" Gender:@"Male" MaritalStatus:@"Single"]];
    
    id<FilterCriteria> male = [[FilterCriteriaMale alloc]init];
    id<FilterCriteria> female = [[FilterCriteriaFemale alloc]init];
    id<FilterCriteria> single = [[FilterCriteriaSingle alloc]init];
    id<FilterCriteria> singleMale = [[FilterAndCriteria alloc]initAndCriteriaWithCriteria:single OtherCriteria:male];
    id<FilterCriteria> singleOrFemale = [[FilterOrCriteria alloc]initOrCriteriaWithCriteria:single OtherCriteria:female];

    NSLog(@"Males: ");
    [self printPersons:[male meetCriteria:persons]];
    
    NSLog(@"Females: ");
    [self printPersons:[female meetCriteria:persons]];
    
    NSLog(@"Single: ");
    [self printPersons:[single meetCriteria:persons]];
    
    NSLog(@"Single Males: ");
    [self printPersons:[singleMale meetCriteria:persons]];

    NSLog(@"Single Or Females: ");
    [self printPersons:[singleOrFemale meetCriteria:persons]];

}

- (void)printPersons:(NSArray<FilterPerson*> *)persons{
    [persons enumerateObjectsUsingBlock:^(FilterPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"Person : [ Name : %@, Gender : %@, Marital Status : %@ ]",obj.name,obj.gender,obj.maritalStatus);
    }];
}
@end
