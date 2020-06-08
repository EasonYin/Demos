//
//  State.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "StateContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface State : NSObject

- (void)doAction:(StateContext *)context;

- (NSString *)toString;

@end

NS_ASSUME_NONNULL_END
