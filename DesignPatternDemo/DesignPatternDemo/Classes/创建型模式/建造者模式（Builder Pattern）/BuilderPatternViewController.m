//
//  BuilderPatternViewController.m
//  DesignPatternDemo
//
//


#import "BuilderPatternViewController.h"
#import "MealBuilder.h"
#import "CarDirector.h"

@interface BuilderPatternViewController ()

@end

@implementation BuilderPatternViewController

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
            MealBuilder* mealBuilder = [MealBuilder new];
            Meal *velMeal = [mealBuilder prepareVegMeal];
            NSLog(@"VegMeal");
            [velMeal showItems];
            NSLog(@"Total Cost:%@",[NSNumber numberWithDouble:[velMeal getCost]]);
            
            Meal *nonVegMeal = [mealBuilder prepareNonVegMeal];
            NSLog(@"nonVegMeal");
            [nonVegMeal showItems];
            NSLog(@"Total Cost:%@",[NSNumber numberWithDouble:[nonVegMeal getCost]]);
        }
            break;
            
        case 2:
        {
            //demo2
            //第一种构建方式
            id<CarBuilder> build = [[CarCompanyBuilder alloc] init];
            
            CarDirector *director = [[CarDirector alloc] initWithBuilder:build];
            
            id<CarCompanyProtocol> car = [director constructWithBody:@"法拉利F1车身" andEngine:@"8缸发动机" andTyre:@"华勤轮胎"];
            
            NSLog(@"car1 = %@",car);
            
            
            //第二种构建方式
            id<CarBuilder> build2 = [[CarCompanyBuilder alloc] init];
            
            id<CarCompanyProtocol> car2 = [[[[build2 buildCarBody:@"五菱宏光"] buildEngine:@"4缸发动机"] buildTyre:@"防滑轮胎"] getCar];
            
            NSLog(@"car2 = %@",car2);
        }
            break;
            
        default:
            break;
    }
}

@end
