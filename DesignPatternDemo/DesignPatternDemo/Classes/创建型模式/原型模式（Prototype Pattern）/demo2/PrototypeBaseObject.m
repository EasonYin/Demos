//
//  PrototypeBaseObject.m
//  DesignPatternDemo
//
//      
//  
//

#import "PrototypeBaseObject.h"

@implementation PrototypeBaseObject

- (id)copyWithZone:(NSZone *)zone{
    PrototypeBaseObject *obj = [[self class] allocWithZone:zone];
    
    //赋值
    [self copyOperationWithObject:obj];
    
    return obj;
}

- (void)copyOperationWithObject:(id)object{
    
}

@end
