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

    }
    return self;
}
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

- (void)tap:(UIGestureRecognizer *)tap {
    NSLog(@"FloatView tap!");
}
@end
