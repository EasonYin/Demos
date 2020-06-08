//
//  InterpreterOrExpression.m
//  DesignPatternDemo
//
//        
//  
//

#import "InterpreterOrExpression.h"

@implementation InterpreterOrExpression

- (instancetype)initWithExpr1:(InterpreterExpression *)expr1 Expr2:(InterpreterExpression *)expr2
{
    self = [super init];
    if (self) {
        _expr1 = expr1;
        _expr2 = expr2;
    }
    return self;
}

- (BOOL)interpret:(NSString *)context
{
    return [_expr1 interpret:context] || [_expr2 interpret:context];
}

@end
