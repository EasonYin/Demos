//
//  Object_OViewController.m
//  DesignPatternDemo
//
//

#import "Object_OViewController.h"
#import "Object_O.h"

@interface Object_OViewController ()
{
    PayHelper *helper;
}
@end

@implementation Object_OViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    helper = [[PayHelper alloc]init];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn1 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn1 setTitle:@"AliPay" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn1 setTag:1];
    [self.view addSubview:btn1];
    [btn1 setCenter:CGPointMake(self.view.frame.size.width/2, 200)];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn2 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn2 setTitle:@"WeChatPay" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn2 setTag:2];
    [self.view addSubview:btn2];
    [btn2 setCenter:CGPointMake(self.view.frame.size.width/2, 300)];
    
}

- (void)doTap:(UIButton *)sender{
    PaySendModel *model = [[PaySendModel alloc]init];

    switch (sender.tag) {
        case 1:
        {
            model.info = @"AliPayProcessor";
        }
            break;
        case 2:
        {
            model.info = @"WeChatPayProcessor";

        }
            break;

        default:
            break;
    }
    
    [helper pay:model];

}

@end
