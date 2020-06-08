//
//  Object_I.m
//  DesignPatternDemo
//
//

#import "Object_I.h"

@implementation SangTaNaCar

- (void)run{
    NSLog(@"SangTaNaCar 汽车跑起来了");
}

- (void)showSpeed{
    NSLog(@"SangTaNaCar 当前行驶速度是80Km/h");
}

@end

@implementation BaoMaCar

- (void)run {
    NSLog(@"BaoMaCar 汽车跑起来了");

}

- (void)showSpeed {
    NSLog(@"BaoMaCar 当前行驶速度是80Km/h");

}

- (void)playMusic {
    NSLog(@"BaoMaCar 播放音乐");

}

@end
