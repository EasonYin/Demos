//
//  Object_CViewController.m
//  DesignPatternDemo
//
//

#import "Object_CViewController.h"
#import "Object_C.h"

@interface Object_CViewController ()

@end

@implementation Object_CViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    Plane *plane = [[Plane alloc]init];
    [plane fly];
}


@end
