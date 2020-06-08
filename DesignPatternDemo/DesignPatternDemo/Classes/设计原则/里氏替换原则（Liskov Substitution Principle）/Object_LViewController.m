//
//  Object_LViewController.m
//  DesignPatternDemo
//
//

#import "Object_LViewController.h"
#import "Object_L.h"

@interface Object_LViewController ()

@end

@implementation Object_LViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Object_LBaoMaCar *bmw = [[Object_LBaoMaCar alloc]init];
    [bmw run];
    [bmw showSpeed];
    
}


@end
