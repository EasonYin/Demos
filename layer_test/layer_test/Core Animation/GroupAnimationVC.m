//
//  GroupAnimationVC.m
//  layer_test
//
//

#import "GroupAnimationVC.h"

@interface GroupAnimationVC ()<CAAnimationDelegate>
{
    CALayer *_layer;
}
@end

@implementation GroupAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"GroupAnimationVC";
    
    UIImage *backgroundImage = [UIImage imageNamed:@"treehole"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    _layer = [[CALayer alloc]init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"treehole"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    [self groupAnimation];
    
}

- (CABasicAnimation *)rotationAnimation{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    CGFloat toValue = M_PI_2*3;
    
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI_2*3];
    basicAnimation.duration = 6.0;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.removedOnCompletion = NO;
    
    [basicAnimation setValue:[NSNumber numberWithFloat:toValue] forKey:@"KCBasicAnimationProperty_ToValue"];
    
    return basicAnimation;
}

- (CAKeyframeAnimation *)translationAnimation{
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGPoint endPoint = CGPointMake(55, 400);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, endPoint.x, endPoint.y);
    keyframeAnimation.path = path;
    CGPathRelease(path);
    
    [keyframeAnimation setValue:[NSValue valueWithCGPoint:endPoint] forKey:@"KCKeyframeAnimationPreperty_EndPosition"];
    
    return keyframeAnimation;
}

- (void)groupAnimation{
    //1.创建动画组
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    //2.设置组中的动画和其他属性
    CABasicAnimation *basicAnimation = [self rotationAnimation];
    CAKeyframeAnimation *keyframeAnimation = [self translationAnimation];
    
    animationGroup.animations = @[basicAnimation,keyframeAnimation];
    animationGroup.delegate = self;
    animationGroup.duration = 10.0;//设置动画时间，如果动画组中动画已经设置过动画属性则不再生效
    
    animationGroup.beginTime = CACurrentMediaTime() + 5;
    
    //3.给图层添加动画
    [_layer addAnimation:animationGroup forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CAAnimationGroup *animationGroup = (CAAnimationGroup *)anim;
    CABasicAnimation *basicAnimation = (CABasicAnimation *)animationGroup.animations[0];
    CAKeyframeAnimation *keyframeAnimation = (CAKeyframeAnimation *)animationGroup.animations[1];
    
    CGFloat toValue = [[basicAnimation valueForKey:@"KCBaiscAnimationProperty_ToValue"] floatValue];
    CGPoint endPoint = [[keyframeAnimation valueForKey:@"KCKeyframeAnimationProperty_EndPosition"] CGPointValue];
    
    [CATransaction begin];
    
    [CATransaction setDisableActions:YES];
    _layer.position = endPoint;
    _layer.transform = CATransform3DMakeRotation(toValue, 0, 0, 1);
    
    [CATransaction commit];
    
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
