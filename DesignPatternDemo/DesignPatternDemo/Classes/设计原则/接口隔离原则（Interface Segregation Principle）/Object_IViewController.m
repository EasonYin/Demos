//
//  Object_IViewController.m
//  DesignPatternDemo
//
//

#import "Object_IViewController.h"
#import "Object_I.h"

@interface Object_IViewController ()

@end

@implementation Object_IViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    SangTaNaCar *sangTaNaCar = [[SangTaNaCar alloc]init];
    [sangTaNaCar run];
    [sangTaNaCar showSpeed];
    
    BaoMaCar *baoMaCar = [[BaoMaCar alloc]init];
    [baoMaCar run];
    [baoMaCar showSpeed];
    [baoMaCar playMusic];
    
}



@end
