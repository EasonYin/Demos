//
//  Object_C.m
//  DesignPatternDemo
//
//

#import "Object_C.h"

@implementation Airfoil
- (void)adjustAngle{
    NSLog(@"调整角度");
}
@end

@interface Plane ()

@property (nonatomic,strong)Airfoil *airfoil;

@end

@implementation Plane

- (instancetype)init{
    if (self == [super init]) {
        self.airfoil = [[Airfoil alloc]init];
    }
    return self;
}

- (void)fly{
    [self.airfoil adjustAngle];
}

@end
