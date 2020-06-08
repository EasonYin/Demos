//
//  VisitorComputerPartVisitor.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VisitorComputerPartVisitor <NSObject>

- (void)visit:(id)obj;

@end

NS_ASSUME_NONNULL_END
