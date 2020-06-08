//
//  Object_D.m
//  DesignPatternDemo
//
//

#import "Object_D.h"

@implementation IGasoline

@end

@implementation Gasoline90
- (NSString *)name{
    return @"90号";
}
@end

@implementation Gasoline93
- (NSString *)name{
    return @"93号";
}
@end

@implementation Object_DCar
- (void)refuel:(IGasoline *)gaso{
    NSLog(@"加%@汽油",gaso.name);
}
@end
