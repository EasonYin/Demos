//
//  CommandPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "CommandPatternViewController.h"
#import "CommandBuyStock.h"
#import "CommandSellStock.h"
#import "CommandBroker.h"
#import "CommandStock.h"

@interface CommandPatternViewController ()

@end

@implementation CommandPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CommandStock *abcStock = [[CommandStock alloc]init];

    CommandBuyStock *buyStockOrder = [[CommandBuyStock alloc]initWithStock:abcStock];
    CommandSellStock *sellStockOrder = [[CommandSellStock alloc]initWithStock:abcStock];
    
    CommandBroker *broker = [[CommandBroker alloc]init];
    [broker takeOrder:buyStockOrder];
    [broker takeOrder:sellStockOrder];
    
    [broker placeOrders];
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
