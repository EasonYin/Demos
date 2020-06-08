//
//  MediatorPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "MediatorPatternViewController.h"
#import "MediatorUser.h"

@interface MediatorPatternViewController ()

@end

@implementation MediatorPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MediatorUser *robert = [[MediatorUser alloc]initWithName:@"Robert"];
    MediatorUser *john = [[MediatorUser alloc]initWithName:@"John"];
    
    [robert sendMessage:@"Hi! John!"];
    [john sendMessage:@"Hello! Robert!"];
    
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
