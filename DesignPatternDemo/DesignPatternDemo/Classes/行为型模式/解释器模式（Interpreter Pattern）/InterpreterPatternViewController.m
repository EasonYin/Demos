//
//  InterpreterPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "InterpreterPatternViewController.h"
#import "InterpreterOrExpression.h"
#import "InterpreterExpression.h"
#import "InterpreterAndExpression.h"
#import "InterpreterTerminalExpression.h"


@interface InterpreterPatternViewController ()

@end

@implementation InterpreterPatternViewController

static inline InterpreterExpression* getMaleExpression()
{
    InterpreterExpression *robert = [[InterpreterTerminalExpression alloc]initWithData:@"Robert"];
    InterpreterExpression *john = [[InterpreterTerminalExpression alloc]initWithData:@"John"];
    InterpreterOrExpression *expr = [[InterpreterOrExpression alloc] initWithExpr1:robert Expr2:john];
    return expr;
}

static inline InterpreterExpression* getMarriedWomanExpression()
{
    InterpreterExpression *julie = [[InterpreterTerminalExpression alloc]initWithData:@"Julie"];
    InterpreterExpression *married = [[InterpreterTerminalExpression alloc]initWithData:@"Married"];
    InterpreterAndExpression *expr = [[InterpreterAndExpression alloc] initWithExpr1:julie Expr2:married];
    return expr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    InterpreterExpression *isMale = getMaleExpression();
    InterpreterExpression *isMarriedWoman = getMarriedWomanExpression();
    
    NSLog(@"John is male? %d",[isMale interpret:@"John"]);
    NSLog(@"Julie is a married women? %d",[isMarriedWoman interpret:@"Married Julie"]);
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
