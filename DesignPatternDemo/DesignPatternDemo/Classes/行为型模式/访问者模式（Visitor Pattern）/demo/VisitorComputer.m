//
//  VisitorComputer.m
//  DesignPatternDemo
//
//        
//  
//

#import "VisitorComputer.h"
#import "VisitorKeyboard.h"
#import "VisitorMonitor.h"
#import "VisitorMouse.h"

@implementation VisitorComputer

static NSArray *parts;

- (instancetype)init
{
    self = [super init];
    if (self) {
        parts = @[[VisitorMouse new],[VisitorMonitor new],[VisitorKeyboard new]];
    }
    return self;
}

- (void)accept:(id<VisitorComputerPartVisitor>)computerPartVisitor
{
    for (NSObject *obj in parts) {
        if ([obj respondsToSelector:@selector(accept:)]) {
            [obj performSelector:@selector(accept:) withObject:computerPartVisitor];
        }
    }
    [computerPartVisitor visit:self];
}
@end
