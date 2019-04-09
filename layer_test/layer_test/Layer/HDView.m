//
//  HDView.m
//  layer_test
//
//

#import "HDView.h"
#import "HDLayer.h"

@implementation HDView

- (instancetype)initWithFrame:(CGRect)frame{
    NSLog(@"HDView initWithFrame:");
    if (self == [super initWithFrame:frame]) {
        HDLayer *layer = [[HDLayer alloc]init];
        layer.bounds = CGRectMake(0, 0, 185, 185);
        layer.position = CGPointMake(160, 284);
        layer.backgroundColor = [UIColor colorWithRed:0 green:146.0/255.0 blue:1.0 alpha:1.0].CGColor;
        [layer setNeedsDisplay];
        
        [self.layer addSublayer:layer];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"HDView drawRect:");
    NSLog(@"CGContext:%@",UIGraphicsGetCurrentContext());
    [super drawRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"HDView drawLayer:inContext:");
    NSLog(@"CGContext:%@",ctx);
    
    [super drawLayer:layer inContext:ctx];
    
}

@end
