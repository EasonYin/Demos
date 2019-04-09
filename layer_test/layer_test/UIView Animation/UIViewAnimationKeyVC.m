//
//  UIViewAnimationKeyVC.m
//  layer_test
//
//  Created by 尹华东 on 2019/3/25.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "UIViewAnimationKeyVC.h"

@interface UIViewAnimationKeyVC ()
{
    UIImageView *_imageView;
}
@end

@implementation UIViewAnimationKeyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UIViewAnimationKeyVC";
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"treehole"]];
    _imageView.frame = CGRectMake(0, 0, 100, 100);
    _imageView.center = CGPointMake(50, 150);
    [self.view addSubview:_imageView];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateKeyframesWithDuration:5.0 delay:0 options:(UIViewAnimationCurveLinear|UIViewAnimationOptionRepeat) animations:^{
        
        //第二个关键帧，（准确的说第一个关键帧是开始位置）：从0秒开始持续50%时间，也就是5*0.5=2.5s
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            _imageView.center = CGPointMake(80, 220);
        }];
        
        //第三个
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            _imageView.center = CGPointMake(45, 300);
        }];

        //第四个
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            _imageView.center = CGPointMake(55, 400);
        }];

        
    } completion:^(BOOL finished) {
        NSLog(@"Animation end.");
    }];
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
