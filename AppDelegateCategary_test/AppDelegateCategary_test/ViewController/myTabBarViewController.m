//
//  myTabBarViewController.m
//  AppDelegateCategary_test
//
//  Created by 尹华东 on 2018/5/15.
//  Copyright © 2018年 EasonYin. All rights reserved.
//

#import "myTabBarViewController.h"

#import "ViewController.h"
#import "SecondViewController.h"


@interface myTabBarViewController ()

@property (nonatomic, strong) ViewController        *firstViewController;
@property (nonatomic, strong) SecondViewController  *secondViewController;

@end

@implementation myTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTabBar];
}

- (void)createTabBar{
    
    self.firstViewController.title = @"首页";
    self.secondViewController.title = @"其他";
    
    UINavigationController *tabHomeNavVC = [[UINavigationController alloc] initWithRootViewController:self.firstViewController];
    UINavigationController *tabOtherNavVC = [[UINavigationController alloc] initWithRootViewController:self.secondViewController];

    self.viewControllers = @[tabHomeNavVC,tabOtherNavVC];
    self.selectedIndex = 0;
}

#pragma mark - lazyinit
- (ViewController *)firstViewController{
    if (!_firstViewController){
        _firstViewController = [[ViewController alloc]init];
    }
    return _firstViewController;
}
-(SecondViewController *)secondViewController{
    if (!_secondViewController){
        _secondViewController = [[SecondViewController alloc]init];
    }
    return _secondViewController;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
