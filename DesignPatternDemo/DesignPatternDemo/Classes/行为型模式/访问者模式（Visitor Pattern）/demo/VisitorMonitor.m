//
//  VisitorMonitor.m
//  DesignPatternDemo
//
//        
//  
//

#import "VisitorMonitor.h"

@implementation VisitorMonitor
- (void)accept:(id<VisitorComputerPartVisitor>)computerPartVisitor
{
    [computerPartVisitor visit:self];
}
@end
