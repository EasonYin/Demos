//
//  TrasitionImageVC.m
//  layer_test
//
//  Created by 尹华东 on 2019/3/25.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "TrasitionImageVC.h"

#define IMAGE_COUNT (5)

@interface TrasitionImageVC ()
{
    UIImageView *_imageView;
    int _currentIndex;
}
@end

@implementation TrasitionImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"TrasitionImageVC";

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
    
    //1.创建转场动画对象
    CATransition *transition = [[CATransition alloc]init];
    
    //2.设置动画类型，注意对于苹果官方公开的动画类型智能使用字符串，并没有对应的常量定义
    transition.type = @"cube";
    
    //设置子类型
    if (isNext) {
        transition.subtype = kCATransitionFromRight;
    }
    else{
        transition.subtype = kCATransitionFromLeft;
    }
    
    //设置动画时长
    transition.duration = 1.0f;
    
    //3.设置转场后的新视图添加转场动画
    _imageView.image = [self getImage:isNext];
    [_imageView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
    
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
