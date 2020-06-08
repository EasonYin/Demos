//
//  MementoCareTaker.m
//  DesignPatternDemo
//
//        
//  
//

#import "MementoCareTaker.h"

@implementation MementoCareTaker

- (instancetype)init
{
    self = [super init];
    if (self) {
        mementoList = [NSMutableArray array];
    }
    return self;
}

- (void)add:(Memento *)memento
{
    [mementoList addObject:memento];
}

- (Memento *)get:(NSInteger)index
{
    return mementoList[index];
}

@end
