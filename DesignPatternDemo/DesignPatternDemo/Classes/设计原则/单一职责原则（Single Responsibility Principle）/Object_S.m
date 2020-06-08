//
//  Object_S.m
//  DesignPatternDemo
//
//

#import "Object_S.h"

@implementation WaitPayList

@end

@implementation WaitGoodsList

@end

@implementation ReceivedGoodsList

@end

@implementation OrderList

- (instancetype)init{
    if (self == [super init]) {
        self.waitPayList = [[WaitPayList alloc]init];
        self.waitGoodsList = [[WaitGoodsList alloc]init];
        self.receivedGoodsList = [[ReceivedGoodsList alloc]init];
    }
    return self;
}

@end

