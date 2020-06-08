//
//  InterpreterExpression.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InterpreterExpression :NSObject

- (BOOL)interpret:(NSString *)context;

@end

NS_ASSUME_NONNULL_END
