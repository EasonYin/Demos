//
//  FacadePatternViewController.m
//  DesignPatternDemo
//
//        .
//  
//

#import "FacadePatternViewController.h"
#import "FacadeShapeMaker.h"

@interface FacadePatternViewController ()

@end

@implementation FacadePatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FacadeShapeMaker *shapeMaker = [[FacadeShapeMaker alloc]init];
    
    [shapeMaker drawCircle];
    [shapeMaker drawRectagnle];
    [shapeMaker drawSquare];
    
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
