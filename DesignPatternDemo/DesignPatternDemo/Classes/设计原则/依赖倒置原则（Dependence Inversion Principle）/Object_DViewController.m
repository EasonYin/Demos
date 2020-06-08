//
//  Object_DViewController.m
//  DesignPatternDemo
//
//

#import "Object_DViewController.h"
#import "Object_D.h"

@interface Object_DViewController ()
{
    Object_DCar *car;
}
@end

@implementation Object_DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    car = [[Object_DCar alloc]init];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn1 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn1 setTitle:@"90号油" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn1 setTag:1];
    [self.view addSubview:btn1];
    [btn1 setCenter:CGPointMake(self.view.frame.size.width/2, 200)];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn2 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn2 setTitle:@"93号油" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn2 setTag:2];
    [self.view addSubview:btn2];
    [btn2 setCenter:CGPointMake(self.view.frame.size.width/2, 300)];
    
    
}

- (void)doTap:(UIButton *)sender{
    IGasoline *gaso = nil;
    
    switch (sender.tag) {
        case 1:
        {
            gaso = [[Gasoline90 alloc]init];
        }
            break;
        case 2:
        {
            gaso = [[Gasoline93 alloc]init];
            
        }
            break;
            
        default:
            break;
    }
    
    [car refuel:gaso];
    
}

@end
