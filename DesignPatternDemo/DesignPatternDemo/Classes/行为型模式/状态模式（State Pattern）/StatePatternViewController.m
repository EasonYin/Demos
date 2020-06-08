//
//  StatePatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "StatePatternViewController.h"
#import "StateContext.h"
#import "State.h"
#import "StartState.h"
#import "StopState.h"

@interface StatePatternViewController ()

@end

@implementation StatePatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    StateContext *context = [StateContext new];
    
    StartState *startState = [StartState new];
    [startState doAction:context];
    NSLog(@"%@",context.state.toString);
    
    StopState *stopState = [StopState new];
    [stopState doAction:context];
    NSLog(@"%@",context.state.toString);
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
