//
//  StartState.m
//  DesignPatternDemo
//
//        
//  
//

#import "StartState.h"

@implementation StartState

- (void)doAction:(StateContext *)context
{
    NSLog(@"Player is in start state");
    context.state = self;
}

- (NSString *)toString
{
    return @"Start State";
}

@end
