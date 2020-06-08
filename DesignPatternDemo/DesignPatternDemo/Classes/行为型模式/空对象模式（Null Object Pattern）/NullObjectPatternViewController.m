//
//  NullObjectPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "NullObjectPatternViewController.h"
#import "NullCustomerFactory.h"
#import "NullRealCustomer.h"
#import "NullCustomer.h"
#import "NullAbstractCustomer.h"

@interface NullObjectPatternViewController ()

@end

@implementation NullObjectPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NullAbstractCustomer *customer1 = [NullCustomerFactory getgetCustomer:@"Rob"];
    NullAbstractCustomer *customer2 = [NullCustomerFactory getgetCustomer:@"Bob"];
    NullAbstractCustomer *customer3 = [NullCustomerFactory getgetCustomer:@"Julie"];
    NullAbstractCustomer *customer4 = [NullCustomerFactory getgetCustomer:@"Laura"];
    
    NSLog(@"Customers");
    NSLog(@"%@",customer1.name);
    NSLog(@"%@",customer2.name);
    NSLog(@"%@",customer3.name);
    NSLog(@"%@",customer4.name);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
