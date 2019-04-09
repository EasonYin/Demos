//
//  UIViewAnimationBaseVC.m
//  layer_test
//
//  Created by 尹华东 on 2019/3/25.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "UIViewAnimationBaseVC.h"

@interface UIViewAnimationBaseVC ()
{
    UIImageView *_imageView;
}
@end

@implementation UIViewAnimationBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UIViewAnimationBaseVC";

    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"treehole"]];
    _imageView.frame = CGRectMake(0, 0, 100, 100);
    _imageView.center = CGPointMake(50, 150);
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    
    //方法一
    /*开始动画，UIView的动画方法执行完后动画会停留在重点位置，而不需要进行任何特殊处理
     duration:执行时间
     delay:延迟时间
     options:动画设置，例如自动恢复、匀速运动等
     completion:动画完成回调方法
     */
//    [UIView animateWithDuration:5.0 delay:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
//        _imageView.center = location;
//    } completion:^(BOOL finished) {
//        NSLog(@"Animation end.");
//    }];
    /*创建弹性动画
     damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
     velocity:弹性复位的速度
     */
    [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1.0 options:(UIViewAnimationOptionCurveLinear) animations:^{
        _imageView.center = location;
    } completion:^(BOOL finished) {
        
    }];
    
    //方法二
//    [UIView beginAnimations:@"KCBasicAnimation" context:nil];
//    [UIView setAnimationDuration:5.0];
//    _imageView.center = location;
//    [UIView commitAnimations];
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
