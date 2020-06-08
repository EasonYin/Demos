//
//  MementoPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "MementoPatternViewController.h"
#import "MementoCareTaker.h"
#import "MementoOriginator.h"
#import "Memento.h"

@interface MementoPatternViewController ()

@end

@implementation MementoPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    MementoOriginator *originator = [MementoOriginator new];
    MementoCareTaker *careTaker = [MementoCareTaker new];
    
    originator.state = @"State #1";
    originator.state = @"State #2";
    [careTaker add:[originator saveStateToMemento]];
    originator.state = @"State #3";
    [careTaker add:[originator saveStateToMemento]];
    originator.state = @"State #4";
    
    NSLog(@"Current State: %@",originator.state);
    [originator getStateFromMemento:[careTaker get:0]];
    NSLog(@"First saved  State: %@",originator.state);
    [originator getStateFromMemento:[careTaker get:1]];
    NSLog(@"Second saved State: %@",originator.state);

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
