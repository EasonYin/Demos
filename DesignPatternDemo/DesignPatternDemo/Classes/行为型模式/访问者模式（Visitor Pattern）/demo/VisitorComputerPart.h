//
//  VisitorComputerPart.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "VisitorComputerPartVisitor.h"

NS_ASSUME_NONNULL_BEGIN

@protocol VisitorComputerPart <NSObject>

- (void)accept:(id <VisitorComputerPartVisitor>)computerPartVisitor;

@end

NS_ASSUME_NONNULL_END
