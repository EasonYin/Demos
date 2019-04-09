//
//  TouchMainViewController.m
//  layer_test
//
//

#import "TouchMainViewController.h"

#define WIDTH (50.0)

@interface TouchMainViewController ()

@end

@implementation TouchMainViewController
- (void)dealloc{
    NSLog(@"TouchMainViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"TouchMainViewController";

    [self drawMyLayer];
}

- (void)drawMyLayer{
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CALayer *layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    layer.position = CGPointMake(size.width/2, size.height/2);
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer.cornerRadius = WIDTH/2;
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity = 9;
//    layer.borderColor = [UIColor whiteColor].CGColor;
//    layer.borderWidth = 1;
//    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CALayer *layer = self.view.layer.sublayers.firstObject;
    CGFloat width = layer.bounds.size.width;
    if (width == WIDTH) {
        width = WIDTH*4;
    }
    else{
        width = WIDTH;
    }
    layer.bounds = CGRectMake(0, 0, width, width);
    layer.position = [touch locationInView:self.view];
    layer.cornerRadius = width/2;
    
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
