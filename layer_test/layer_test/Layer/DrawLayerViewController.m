//
//  DrawLayerViewController.m
//  layer_test
//
//

#import "DrawLayerViewController.h"

#define PHOTO_HEIGHT (200)

@interface DrawLayerViewController ()<CALayerDelegate>
@property (nonatomic,strong) CALayer *layer;
@end

@implementation DrawLayerViewController
- (void)dealloc{
    NSLog(@"DrawLayerViewController dealloc");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.layer removeFromSuperlayer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"DrawLayerViewController";

    CGPoint position = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    CGRect bounds = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);;
    CGFloat cornerRadius = PHOTO_HEIGHT/2;
    CGFloat borderWidth = 2;
    
    //容器图层
    CALayer *layer = [[CALayer alloc]init];
    layer.bounds = bounds;
    layer.position = position;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = cornerRadius;
    layer.masksToBounds = YES;
    //阴影效果无法和masksToBounds同时使用，因为masksToBounds的目的就是剪切外边框，而阴影效果刚好在外边框
//    layer.shadowColor = [UIColor grayColor].CGColor;
//    layer.shadowOffset = CGSizeMake(2, 2);
//    layer.shadowOpacity = 1;
    layer.borderColor = [UIColor whiteColor].CGColor;
    layer.borderWidth = borderWidth;
    
    //1.利用图层形变解决图像倒立问题，可以不使用context设置了
//    layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    layer.delegate = self;

    //3.直接设置layer的contents就可以不牵扯到绘图，就没有倒立的问题了
//    layer.contents = (id)[UIImage imageNamed:@"treehole"].CGImage;
    
    //4.通过KVC动态修改属性
    [layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
    
    
    self.layer = layer;
    [self.view.layer addSublayer:self.layer];
    
    //阴影图层
    CALayer *layerShadow = [[CALayer alloc]init];
    layerShadow.bounds = bounds;
    layerShadow.position = position;
    layerShadow.cornerRadius = cornerRadius;
    layerShadow.shadowColor = [UIColor grayColor].CGColor;
    layerShadow.shadowOffset = CGSizeMake(2, 1);
    layerShadow.shadowOpacity = 1;
    layerShadow.borderColor = [UIColor whiteColor].CGColor;
    layerShadow.borderWidth = borderWidth;
    [self.view.layer addSublayer:layerShadow];
    
    [self.layer setNeedsDisplay];
}

#pragma mark - delegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{

    //这个图层正是上面定义的图层
    CGContextSaveGState(ctx);
    
    //2.图形上下文形变，解决图片倒立的问题
//    CGContextScaleCTM(ctx, 1, -1);
//    CGContextTranslateCTM(ctx, 0, -PHOTO_HEIGHT);
    
    UIImage *image = [UIImage imageNamed:@"treehole"];
    //注意这个位置是相对于图层而言的不是屏幕
    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT), image.CGImage);
    
    CGContextRestoreGState(ctx);
    
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
