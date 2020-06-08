//
//  SingletonObject.m
//  DesignPatternDemo
//
//

#import "SingletonObject.h"

@implementation SingletonObject

static SingletonObject *shareObject = nil;
+ (instancetype)shareObject{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareObject = [[SingletonObject alloc]init];
    });
    return shareObject;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (shareObject == nil)
        {
            shareObject = [super allocWithZone:zone];
        }
        return shareObject;
    }
    
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

@end
