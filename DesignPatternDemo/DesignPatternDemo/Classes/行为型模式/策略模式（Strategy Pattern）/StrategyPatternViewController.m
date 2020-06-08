//
//  StrategyPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "StrategyPatternViewController.h"
#import "StrategyContext.h"
#import "StrategyOperationMultiply.h"
#import "StrategyOperationSubtract.h"
#import "StrategyOperationAdd.h"

@interface StrategyPatternViewController ()

@end

@implementation StrategyPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    StrategyOperationAdd *add = [StrategyOperationAdd new];
    StrategyOperationSubtract *subtract = [StrategyOperationSubtract new];
    StrategyOperationMultiply *multiply = [StrategyOperationMultiply new];
    
    StrategyContext *context = [[StrategyContext alloc]initWithStragery:add];
    NSLog(@"10 + 5 = %d",[context executeStrategyNum1:10 Num2:5]);
    context = [[StrategyContext alloc]initWithStragery:subtract];
    NSLog(@"10 - 5 = %d",[context executeStrategyNum1:10 Num2:5]);
    context = [[StrategyContext alloc]initWithStragery:multiply];
    NSLog(@"10 * 5 = %d",[context executeStrategyNum1:10 Num2:5]);
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
