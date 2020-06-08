//
//  Object_LODViewController.m
//  DesignPatternDemo
//
//

#import "Object_LODViewController.h"
#import "Object_LOD.h"

@interface Object_LODViewController ()
{
    Object_LODCar *car;
    WorkerInPetrolStation *worker;
    Person *person;
}
@end

@implementation Object_LODViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    car = [[Object_LODCar alloc]init];
    worker = [[WorkerInPetrolStation alloc]init];
    person = [[Person alloc]init];
    
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
    Object_LODIGasoline *gaso = nil;
    
    switch (sender.tag) {
        case 1:
        {
            gaso = [[Object_LODGasoline90 alloc]init];

        }
            break;
        case 2:
        {
            gaso = [[Object_LODGasoline93 alloc]init];

        }
            break;
            
        default:
            break;
    }
    
    [person refuel:car worker:worker gaso:gaso];
    
}

@end
