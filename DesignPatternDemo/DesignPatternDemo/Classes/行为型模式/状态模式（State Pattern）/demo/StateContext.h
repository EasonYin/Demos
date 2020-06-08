//
//  StateContext.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class State;
@interface StateContext : NSObject

@property (nonatomic,strong) State *state;

@end

NS_ASSUME_NONNULL_END
