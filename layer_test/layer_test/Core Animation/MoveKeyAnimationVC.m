//
//  MoveKeyAnimationVC.m
//  layer_test
//
///

#import "MoveKeyAnimationVC.h"

@interface MoveKeyAnimationVC ()
{
    CALayer *_layer;
}
@end

@implementation MoveKeyAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MoveKeyAnimationVC";

    UIImage *backgroundImage = [UIImage imageNamed:@"treehole"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    _layer = [[CALayer alloc]init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"treehole"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    [self translationAnimation];
    
}

- (void)translationAnimation{
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.设置关键帧
    //这里有四个关键帧
//    NSValue *key1 = [NSValue valueWithCGPoint:_layer.position];//关键帧动画初始值不能省略
//    NSValue *key2 = [NSValue valueWithCGPoint:CGPointMake(80, 220)];
//    NSValue *key3 = [NSValue valueWithCGPoint:CGPointMake(45, 300)];
//    NSValue *key4 = [NSValue valueWithCGPoint:CGPointMake(55, 400)];
//    NSArray *values = @[key1,key2,key3,key4];
//    keyframeAnimation.values = values;
    
    //绘制贝塞尔曲线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);//移动到起始点
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);//绘制二次贝塞尔曲线
    keyframeAnimation.path = path;//设置path属性
    CGPathRelease(path);
    
    
    //设置其他属性
    keyframeAnimation.duration = 8.0;
    keyframeAnimation.beginTime = CACurrentMediaTime() + 2;//设置延迟2秒执行

    //3.添加动画到图层，添加动画后就会执行动画
    [_layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
    
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
