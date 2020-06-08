//
//  VisitorMouse.m
//  DesignPatternDemo
//
//        
//  
//

#import "VisitorMouse.h"

@implementation VisitorMouse
- (void)accept:(id<VisitorComputerPartVisitor>)computerPartVisitor
{
    [computerPartVisitor visit:self];
}
@end
