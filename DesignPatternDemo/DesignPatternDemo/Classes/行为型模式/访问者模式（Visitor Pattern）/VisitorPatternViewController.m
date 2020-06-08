//
//  VisitorPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "VisitorPatternViewController.h"
#import "VisitorComputerPartDisplayVisitor.h"
#import "VisitorComputerPart.h"
#import "VisitorComputer.h"

@interface VisitorPatternViewController ()

@end

@implementation VisitorPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    VisitorComputer *computer = [VisitorComputer new];
    VisitorComputerPartDisplayVisitor *display = [VisitorComputerPartDisplayVisitor new];
    [computer accept:display];
    
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
