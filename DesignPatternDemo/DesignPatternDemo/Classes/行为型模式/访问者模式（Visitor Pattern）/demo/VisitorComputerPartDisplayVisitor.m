//
//  VisitorComputerPartDisplayVisitor.m
//  DesignPatternDemo
//
//        
//  
//

#import "VisitorComputerPartDisplayVisitor.h"
#import "VisitorComputer.h"
#import "VisitorKeyboard.h"
#import "VisitorMonitor.h"
#import "VisitorMouse.h"

@implementation VisitorComputerPartDisplayVisitor
- (void)visit:(id)obj
{
    if ([obj isKindOfClass:[VisitorComputer class]]) {
        NSLog(@"Displaying Computer.");
    }
    else if ([obj isKindOfClass:[VisitorKeyboard class]])
    {
        NSLog(@"Displaying Keyboard.");
    }
    else if ([obj isKindOfClass:[VisitorMonitor class]])
    {
        NSLog(@"Displaying Monitor.");
    }
    else if ([obj isKindOfClass:[VisitorMouse class]])
    {
        NSLog(@"Displaying Mouse.");
    }
}
@end
