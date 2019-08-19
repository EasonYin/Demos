//
//  NSObject+EYInvocation.m
//  InvocationDemo
//
//  Created by 尹华东 on 2019/8/19.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import "NSObject+EYInvocation.h"

@implementation NSObject (EYInvocation)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects{
    
    //初始化signature
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    
    //方法判空
    if (!signature) {
        //抛出异常
        NSString *reason = [NSString stringWithFormat:@"方法不存在：%@",NSStringFromSelector(aSelector)];
        @throw [NSException exceptionWithName:@"error" reason:reason userInfo:nil];
    }
    
    //初始化invocation
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;
    
    //signature.numberOfArguments 包含target和selector两个参数，所以减2
    NSInteger paramsCount = signature.numberOfArguments - 2;
    
    //判断函数所需参数及objects参数个数，若objects个数多于函数所需参数，只取到函数所需个数；若objects个数少于函数所需参数，不处理，默认nil
    paramsCount = MIN(paramsCount, objects.count);
    
    for (NSInteger index = 0; index < paramsCount; index ++) {
        id obj = objects[index];
        //传入参数为nil略过
        if ([obj isKindOfClass:[NSNull class]]) {
            continue;
        }
        [invocation setArgument:&obj atIndex:index+2];
    }
    
    //调用方法
    [invocation invoke];
    
    //带返回值参数处理
    /*
     原因是在arc模式下，
     getReturnValue：仅仅是从invocation的返回值拷贝到指定的内存地址，如果返回值是一个NSObject对象的话，是没有处理起内存管理的。
     而我们在定义returnValue时使用的是__strong类型的指针对象，arc就会假设该内存块已被retain（实际没有），
     当returnValue出了定义域释放时，导致该crash。假如在定义之前有赋值的话，还会造成内存泄露的问题。
     */
    id __unsafe_unretained returnValue = nil;
    if (signature.methodReturnLength > 0) {
        //获取返回值
        [invocation getReturnValue:&returnValue];
    }
    id resutl = returnValue;
    return resutl;
    
//    void *returnValue = NULL;
//    if (signature.methodReturnLength) {
//        [invocation getReturnValue:&returnValue];
//    }
//    return (__bridge id)returnValue;
}

@end
