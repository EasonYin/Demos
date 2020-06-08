//
//  InterpreterOrExpression.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "InterpreterExpression.h"

NS_ASSUME_NONNULL_BEGIN

@interface InterpreterOrExpression : InterpreterExpression
{
    @private
    InterpreterExpression *_expr1;
    InterpreterExpression *_expr2;
}

- (instancetype)initWithExpr1:(InterpreterExpression *)expr1 Expr2:(InterpreterExpression *)expr2;

@end

NS_ASSUME_NONNULL_END
