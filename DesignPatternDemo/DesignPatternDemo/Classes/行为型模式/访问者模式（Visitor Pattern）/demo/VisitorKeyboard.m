//
//  VisitorKeyboard.m
//  DesignPatternDemo
//
//        
//  
//

#import "VisitorKeyboard.h"

@implementation VisitorKeyboard
- (void)accept:(id<VisitorComputerPartVisitor>)computerPartVisitor
{
    [computerPartVisitor visit:self];
}
@end
