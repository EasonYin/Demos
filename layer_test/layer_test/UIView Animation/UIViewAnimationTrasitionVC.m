//
//  UIViewAnimationTrasitionVC.m
//  layer_test
//
//  Created by 尹华东 on 2019/3/25.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "UIViewAnimationTrasitionVC.h"
#define IMAGE_COUNT (5)

@interface UIViewAnimationTrasitionVC ()
{
    UIImageView *_imageView;
    int _currentIndex;
}

@end

@implementation UIViewAnimationTrasitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UIViewAnimationTrasitionVC";
    
    _imageView = [[UIImageView alloc]init];
    _imageView.frame = [UIScreen mainScreen].bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = [UIImage imageNamed:@"0.jpg"];
    [self.view addSubview:_imageView];
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
}

#pragma mark 向左滑动浏览下一张图片
- (void)leftSwipe:(UISwipeGestureRecognizer*)gesture{
    [self transitionAnimation:YES];
}

#pragma mark 向右滑动浏览上一张图片
- (void)rightSwipe:(UISwipeGestureRecognizer*)gesture{
    [self transitionAnimation:NO];
}

#pragma mark 转场动画
- (void)transitionAnimation:(BOOL)isNext{
    
    UIViewAnimationOptions option;
    
    if (isNext) {
        option = UIViewAnimationCurveLinear|UIViewAnimationOptionTransitionFlipFromRight;
    }
    else{
        option = UIViewAnimationOptionCurveLinear|UIViewAnimationOptionTransitionFlipFromLeft;
    }
    
    [UIView transitionWithView:_imageView duration:1.0 options:option animations:^{
        _imageView.image = [self getImage:isNext];
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark 取得当前图片
- (UIImage *)getImage:(BOOL)isNext{
    if (isNext) {
        _currentIndex = (_currentIndex+1)%IMAGE_COUNT;
    }
    else{
        _currentIndex = (_currentIndex-1+IMAGE_COUNT)%IMAGE_COUNT;
    }
    NSString *imageName = [NSString stringWithFormat:@"%i.jpg",_currentIndex];
    return [UIImage imageNamed:imageName];
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
