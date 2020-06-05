//
//  ViewController.m
//  TouchDemo
//
//  Created by 尹华东 on 2019/4/15.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import "FloatView.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"ViewController";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addNomalView];
    
    [self addSepicalView];
    
    [self addFloatView];
    
    [self setNavBtn];
}

- (void)setNavBtn
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setTitle:@"statusBar" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(doNavAction:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = bar;
}

- (void)doNavAction:(id)sender
{
    TestViewController *vc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addNomalView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 20, self.view.frame.size.width - 20, 200)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    label.text = @"View A";
    [label sizeToFit];
    [view addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapA:)];
    [view addGestureRecognizer:tap];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setFrame:CGRectMake(0, 0, 120, 40)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"Button A" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnA:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setCenter:view.center];
    [view addSubview:btn];
}

- (void)addSepicalView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 500, self.view.frame.size.width/2, self.view.frame.size.width/2)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    label.text = @"View B";
    [label sizeToFit];
    [view addSubview:label];
    [label setCenter:CGPointMake(view.frame.size.width-label.frame.size.width, label.frame.size.height)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapB:)];
    [view addGestureRecognizer:tap];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setFrame:CGRectMake(0, 0, 120, 40)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"Button B" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnB:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setCenter:CGPointMake(view.frame.size.width/2, view.frame.size.height/2+40)];
    [view addSubview:btn];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(-self.view.frame.size.width/4, -self.view.frame.size.width/4, self.view.frame.size.width/2, self.view.frame.size.width/2)];
    view1.backgroundColor = [UIColor yellowColor];
    [view addSubview:view1];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view1.frame.size.width, view1.frame.size.height)];
    label1.text = @"View C";
    [label1 sizeToFit];
    [view1 addSubview:label1];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapC:)];
    [view1 addGestureRecognizer:tap1];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn1 setFrame:CGRectMake(0, 0, 80, 80)];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [btn1 setTitle:@"部分好用" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(btnC:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn1 setCenter:CGPointMake(view1.frame.size.width/2, view1.frame.size.height/2)];
    [view1 addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn2 setFrame:CGRectMake(view1.frame.size.width/2, 0, view1.frame.size.width/2, 40)];
    [btn2 setBackgroundColor:[UIColor redColor]];
    [btn2 setTitle:@"不好用" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(btnC:) forControlEvents:(UIControlEventTouchUpInside)];
    [view1 addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn3 setFrame:CGRectMake(view1.frame.size.width/2, view1.frame.size.height - 40, view1.frame.size.width/2, 40)];
    [btn3 setBackgroundColor:[UIColor redColor]];
    [btn3 setTitle:@"好用" forState:(UIControlStateNormal)];
    [btn3 addTarget:self action:@selector(btnC:) forControlEvents:(UIControlEventTouchUpInside)];
    [view1 addSubview:btn3];
}

- (void)addFloatView{
    FloatView *floatView = [[FloatView alloc]initWithFrame:CGRectMake(100, 200, 80, 80)];
    floatView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:floatView];
}

- (void)tapA:(UIGestureRecognizer *)sender{
    NSLog(@"tap A!");
}

- (void)btnA:(UIButton *)sender{
    NSLog(@"btn A!");
}

- (void)tapB:(UIGestureRecognizer *)sender{
    NSLog(@"tap B!");
}

- (void)btnB:(UIButton *)sender{
    NSLog(@"btn B!");
}

- (void)tapC:(UIGestureRecognizer *)sender{
    NSLog(@"tap C!");
}

- (void)btnC:(UIButton *)sender{
    NSLog(@"btn C!");
}

@end
