//
//  MementoOriginator.m
//  DesignPatternDemo
//
//        
//  
//

#import "MementoOriginator.h"

@implementation MementoOriginator

- (Memento *)saveStateToMemento
{
    Memento *memento = [Memento new];
    memento.state = self.state;
    return memento;
}

- (void)getStateFromMemento:(Memento *)memento
{
    self.state = memento.state;
}

@end
