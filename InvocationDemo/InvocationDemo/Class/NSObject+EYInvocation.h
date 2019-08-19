//
//  NSObject+EYInvocation.h
//  InvocationDemo
//
//  Created by 尹华东 on 2019/8/19.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (EYInvocation)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;

@end

NS_ASSUME_NONNULL_END
