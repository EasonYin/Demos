//
//  InterpreterTerminalExpression.h
//  DesignPatternDemo
//
//        
//  
//

#import "InterpreterExpression.h"

NS_ASSUME_NONNULL_BEGIN

@interface InterpreterTerminalExpression : InterpreterExpression
{
    @private
    NSString *_data;
}

- (instancetype)initWithData:(NSString *)data;

@end

NS_ASSUME_NONNULL_END
