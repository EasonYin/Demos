//
//  EYViewController.m
//  EYQRCodeTools
//
//  Created by huadong2593@163.com on 08/14/2019.
//  Copyright (c) 2019 huadong2593@163.com. All rights reserved.
//

#import "EYViewController.h"
#import <EYQRCodeTools/EYQRCodeTools-umbrella.h>
#import "EYGenerationViewController.h"

@interface EYViewController ()<EYQRCodeScanViewControllerDelegate>

@end

@implementation EYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn0 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn0 setTitle:@"扫描二维码/条形码" forState:(UIControlStateNormal)];
    [btn0 setFrame:CGRectMake(0, 0, 200, 40)];
    [btn0 addTarget:self action:@selector(doTap0:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn0];
    [btn0 setCenter:CGPointMake(self.view.frame.size.width/2, 200)];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn1 setTitle:@"生成二维码/条形码" forState:(UIControlStateNormal)];
    [btn1 setFrame:CGRectMake(0, 0, 200, 40)];
    [btn1 addTarget:self action:@selector(doTap1:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn1];
    [btn1 setCenter:CGPointMake(self.view.frame.size.width/2, 300)];
    
}

- (void)doTap0:(UIButton *)sender{
    EYQRCodeScanViewController *scanVC = [[EYQRCodeScanViewController alloc]init];
    scanVC.delegate = self;
    scanVC.showPhotoLibrary = YES;
    scanVC.title = @"扫描二维码";
    [self.navigationController pushViewController:scanVC animated:YES];
}

- (void)doTap1:(UIButton *)sender{
    EYGenerationViewController *generationVC = [[EYGenerationViewController alloc]init];
    [self.navigationController pushViewController:generationVC animated:YES];
}

#pragma mark - EYQRCodeScanViewControllerDelegate
- (void)EYQRCodeScanViewController:(EYQRCodeScanViewController *)VC didScanResult:(NSString *)result{
    if (result) {
        EYGenerationViewController *generationVC = [[EYGenerationViewController alloc]init];
        generationVC.code = result;
        [self.navigationController pushViewController:generationVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
