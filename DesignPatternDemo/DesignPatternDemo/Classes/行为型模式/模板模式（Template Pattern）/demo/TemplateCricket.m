//
//  TemplateCricket.m
//  DesignPatternDemo
//
//        
//  
//

#import "TemplateCricket.h"

@implementation TemplateCricket
- (void)initialize
{
    NSLog(@"Cricket Game Finished!");
}

- (void)startPlay
{
    NSLog(@"Cricket Game Initialized! Start playing.");
}

- (void)endPlay
{
    NSLog(@"Cricket Game Started. Enjoy the game!");
}
@end
