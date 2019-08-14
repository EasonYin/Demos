//
//  EYGenerationViewController.m
//  EYQRCodeTools_Example
//
//  Created by 尹华东 on 2019/8/14.
//  Copyright © 2019 huadong2593@163.com. All rights reserved.
//

#import "EYGenerationViewController.h"
#import <EYQRCodeTools/EYQRCodeTools-umbrella.h>

@interface EYGenerationViewController ()

@property (strong, nonatomic) UIImageView *codeImageView;
@property (strong, nonatomic) UITextField *codeTextField;

@end

@implementation EYGenerationViewController

- (UITextField *)codeTextField{
    if (!_codeTextField) {
        _codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 40, 30)];
        _codeTextField.placeholder = @"输入内容";
        _codeTextField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:_codeTextField];
    }
    return _codeTextField;
}

- (UIImageView *)codeImageView{
    if (!_codeImageView) {
        _codeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        [self.view addSubview:_codeImageView];
    }
    return _codeImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"二维码/条形码";
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.codeTextField.text = self.code;
    
    [self.codeTextField setCenter:CGPointMake(self.view.frame.size.width/2, self.navigationController.navigationBar.frame.size.height + 100)];

    [self.codeImageView setCenter:CGPointMake(self.view.frame.size.width/2, self.codeTextField.center.y+150)];
    
    UIButton *btn0 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn0 setTitle:@"生产二维码" forState:(UIControlStateNormal)];
    [btn0 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn0 addTarget:self action:@selector(doTap0:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn0];
    [btn0 setCenter:CGPointMake(self.view.frame.size.width/2, self.codeTextField.center.y+350)];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn1 setTitle:@"生成条形码" forState:(UIControlStateNormal)];
    [btn1 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn1 addTarget:self action:@selector(doTap1:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn1];
    [btn1 setCenter:CGPointMake(self.view.frame.size.width/2, self.codeTextField.center.y+400)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)doTap0:(UIButton *)sender{
    __block NSString *text = _codeTextField.text;
    __block CGSize size = _codeImageView.bounds.size;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *code = text.length? text: self.codeTextField.placeholder;
        UIImage *codeImage = [EYQRCodeManager generateQRCode:code size:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.codeImageView.image = codeImage;
        });
    });
}

- (void)doTap1:(UIButton *)sender{
    __block NSString *text = _codeTextField.text;
    __block CGSize size = _codeImageView.bounds.size;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *code = text.length? text: self.codeTextField.placeholder;
        UIImage *codeImage = [EYQRCodeManager generateCode128:code size:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.codeImageView.image = codeImage;
        });
    });
}

- (void)viewTap:(id)sender{
    [self.view endEditing:YES];
}

@end
