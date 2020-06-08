//
//  BridgeCircle.m
//  DesignPatternDemo
//
//    
//  
//

#import "BridgeCircle.h"

@interface BridgeCircle ()

@property (nonatomic,assign) int x,y,radius;

@end

@implementation BridgeCircle

- (void)CircleWithDrawAPI:(id<BridgeDrawAPI>)drawAPI radius:(int)radius x:(int)x y:(int)y{
    [super Shape:drawAPI];
    self.x = x;
    self.y = y;
    self.radius = radius;
}

- (void)draw{
    [self.drawAPI drawCircleWithRadius:self.radius x:self.x y:self.y];
}


@end
