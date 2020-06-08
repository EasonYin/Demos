//
//  InterpreterTerminalExpression.m
//  DesignPatternDemo
//
//        
//  
//

#import "InterpreterTerminalExpression.h"

@implementation InterpreterTerminalExpression

- (instancetype)initWithData:(NSString *)data
{
    self = [super init];
    if (self) {
        _data = data;
    }
    return self;
}

- (BOOL)interpret:(NSString *)context
{
    if ([context containsString:_data]) {
        return true;
    }
    return false;
}

@end
