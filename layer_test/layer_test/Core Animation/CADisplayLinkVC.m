//
//  CADisplayLinkVC.m
//  layer_test
//
//  Created by 尹华东 on 2019/3/25.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "CADisplayLinkVC.h"

#define IMAGE_COUNT (6)

@interface CADisplayLinkVC ()
{
    CALayer *_layer;
    int _index;
    NSMutableArray *_images;
}
@end

@implementation CADisplayLinkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"CADisplayLinkVC";

    self.view.layer.contents = (id)[UIImage imageNamed:@"0.jpg"].CGImage;
    
    _layer = [[CALayer alloc]init];
    _layer.bounds = CGRectMake(0, 0, self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
    _layer.position = CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
    [self.view.layer addSublayer:_layer];
    
    _images = [NSMutableArray array];
    for (int i = 0; i < 6; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"%i.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [_images addObject:image];
    }
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(step)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)step{
    static int s= 0;
    if (++s%6 == 0) {
        UIImage *image = _images[_index];
        _layer.contents = (id)image.CGImage;
        _index = (_index+1)%IMAGE_COUNT;
    }
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
