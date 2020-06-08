//
//  StopState.m
//  DesignPatternDemo
//
//        
//  
//

#import "StopState.h"

@implementation StopState

- (void)doAction:(StateContext *)context
{
    NSLog(@"Player is in stop state");
    context.state = self;
}

- (NSString *)toString
{
    return @"Stop State";
}

@end
