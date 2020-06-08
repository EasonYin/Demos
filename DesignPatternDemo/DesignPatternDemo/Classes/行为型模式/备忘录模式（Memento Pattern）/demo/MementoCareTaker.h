//
//  MementoCareTaker.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "Memento.h"

NS_ASSUME_NONNULL_BEGIN

@interface MementoCareTaker : NSObject
{
    @private
    NSMutableArray <Memento *> *mementoList;
    
}

- (void)add:(Memento *)memento;
- (Memento *)get:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
