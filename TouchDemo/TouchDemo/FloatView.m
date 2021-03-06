//
//  FloatView.m
//  TouchDemo
//
//  Created by 尹华东 on 2019/4/15.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "FloatView.h"

#define SCREEN_WIDTH                    CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_HEIGHT                   CGRectGetHeight([[UIScreen mainScreen] bounds])
#define kFloatBallMargin (10)

@implementation FloatView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [label setText:@"FloatView"];
        [self addSubview:label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];


    }
    return self;
}

- (void)tap:(UIGestureRecognizer *)tap {
    NSLog(@"FloatView tap!");
}

/*
//touch方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"FloatView touchesBegan!");

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"FloatView touchesMoved!");

    UITouch *touch = [touches anyObject];

    //求偏移量 = 手指当前点的X - 手指上一个点的X
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint prePoint = [touch previousLocationInView:self];

    CGFloat offSetX = currentPoint.x - prePoint.x;
    CGFloat offSetY = currentPoint.y - prePoint.y;

    //平移
    self.transform = CGAffineTransformTranslate(self.transform, offSetX, offSetY);

}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"FloatView touchesCancelled!");

    [self endTouch:[touches.anyObject locationInView:self.superview]];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"FloatView touchesEnded!");

    [self endTouch:[touches.anyObject locationInView:self.superview]];

}
*/

//UIPanGestureRecognizer
- (void)pan:(UIPanGestureRecognizer *)pan {
    NSLog(@"FloatView pan!");
    
    //求偏移量 = 手指当前点的X - 手指上一个点的X
    CGPoint pt = [pan translationInView:self];
    pan.view.center = CGPointMake(pan.view.center.x +pt.x , pan.view.center.y + pt.y);
    //每次移动完，将移动量置为0，否则下次移动会加上这次移动量
    [pan setTranslation:CGPointMake(0, 0) inView:self];

    if (pan.state == UIGestureRecognizerStateEnded) {
        NSLog(@"pan.view.center == %@", NSStringFromCGPoint(pan.view.center));
        [self endTouch:pan.view.center];
    }
}

//自动贴边
- (void)endTouch:(CGPoint)point {
    
    CGRect frame = self.frame;
    
    if (point.x > SCREEN_WIDTH / 2) {
        frame.origin.x = SCREEN_WIDTH - frame.size.width - kFloatBallMargin;
    } else {
        frame.origin.x = kFloatBallMargin;
    }
    
    if (frame.origin.y > (SCREEN_HEIGHT - frame.size.height - kFloatBallMargin)) {
        frame.origin.y = SCREEN_HEIGHT - frame.size.height - kFloatBallMargin;
    } else if (frame.origin.y < kFloatBallMargin) {
        frame.origin.y = kFloatBallMargin;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = frame;
    }];
}

@end
