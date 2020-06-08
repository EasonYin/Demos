//
//  MementoOriginator.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "Memento.h"

NS_ASSUME_NONNULL_BEGIN

@interface MementoOriginator : NSObject

@property (nonatomic,copy) NSString *state;

- (Memento *)saveStateToMemento;
- (void)getStateFromMemento:(Memento *)memento;

@end

NS_ASSUME_NONNULL_END
