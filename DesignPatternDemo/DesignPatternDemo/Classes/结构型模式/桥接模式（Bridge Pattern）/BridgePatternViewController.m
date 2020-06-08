//
//  BridgePatternViewController.m
//  DesignPatternDemo
//
//    
//  
//

#import "BridgePatternViewController.h"
#import "BridgeCircle.h"
#import "BridgeRedCircle.h"
#import "BridgeGreenCircle.h"

#import "BridgeHaierAirConditioner.h"
#import "BridgeGeliAirConditioner.h"
#import "BridgeDirectionRemote.h"
#import "BridgeTemperatureRemote.h"

@interface BridgePatternViewController ()

@end

@implementation BridgePatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn1 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn1 setTitle:@"demo1" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn1 setTag:1];
    [self.view addSubview:btn1];
    [btn1 setCenter:CGPointMake(self.view.frame.size.width/2, 200)];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn2 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn2 setTitle:@"demo2" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn2 setTag:2];
    [self.view addSubview:btn2];
    [btn2 setCenter:CGPointMake(self.view.frame.size.width/2, 300)];
    
}

- (void)doTap:(UIButton *)sender{
    switch (sender.tag) {
        case 1:
        {
            //demo1
            BridgeCircle *redCircle = [[BridgeCircle alloc]init];
            [redCircle CircleWithDrawAPI:[BridgeRedCircle new] radius:10 x:100 y:100];
            
            BridgeCircle *greenCircle = [[BridgeCircle alloc]init];
            [greenCircle CircleWithDrawAPI:[BridgeGreenCircle new] radius:20 x:200 y:200];
            
            [redCircle draw];
            
            [greenCircle draw];
        }
            break;
            
        case 2:
        {
            //demo2
            //海尔空调
            BridgeHaierAirConditioner *haierAirConditioner =  [[BridgeHaierAirConditioner alloc] init];
            
            //控制风向
            BridgeDirectionRemote *directionRemote = [[BridgeDirectionRemote alloc] init];
            //让海尔空调往上吹风
            directionRemote.airConditioner = haierAirConditioner;
            [directionRemote up];
            
            //控制温度
            BridgeTemperatureRemote *temperatureRemote = [[BridgeTemperatureRemote alloc] init];
            //让海尔空调更冷
            temperatureRemote.airConditioner = haierAirConditioner;
            [temperatureRemote colder];
            
            //=====================================================================================
            
            //让格力空调往下吹热风
            BridgeGeliAirConditioner *geliAirConditioner =  [[BridgeGeliAirConditioner alloc] init];
            directionRemote.airConditioner = geliAirConditioner;
            [directionRemote down];
            temperatureRemote.airConditioner = geliAirConditioner;
            [temperatureRemote warmer];
            
        }
            break;
            
        default:
            break;
    }
}


@end
