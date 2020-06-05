#import "NSObject+Safe.h"

#if TARGET_OS_IPHONE
#import <objc/runtime.h>
#import <objc/message.h>
#else
#import <objc/objc-class.h>
#endif

@implementation NSObject (Safe)

- (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

@implementation NSArray (Safe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            
            [objc_getClass("__NSArray0") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(emptyObjectIndex:)];
            
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(arrObjectIndex:)];
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(arrObjectAtIndexedSubscript:)];

            [objc_getClass("__NSSingleObjectArrayI") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(arrSingleObjectIndex:)];

            [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(mutableObjectIndex:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(mutableObjectAtIndexedSubscript:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(insertObject:atIndex:) swizzledSelector:@selector(mutableInsertObject:atIndex:)];
        }
    });
}

- (id)emptyObjectIndex:(NSInteger)index{
    return nil;
}

- (id)arrObjectIndex:(NSInteger)index{
    @autoreleasepool {
        if (index >= self.count || index < 0) {
            return nil;
        }
        return [self arrObjectIndex:index];
    }
}

- (id)arrObjectAtIndexedSubscript:(NSInteger)index{
    @autoreleasepool {
        if (index >= self.count || index < 0) {
            return nil;
        }
        return [self arrObjectAtIndexedSubscript:index];
    }
}

- (id)arrSingleObjectIndex:(NSInteger)index{
    @autoreleasepool {
        if (index >= self.count || index < 0) {
            return nil;
        }
        return [self arrSingleObjectIndex:index];
    }
}

- (id)mutableObjectIndex:(NSInteger)index{
    @autoreleasepool {
        if (index >= self.count || index < 0) {
            return nil;
        }
        return [self mutableObjectIndex:index];
    }
}

- (id)mutableObjectAtIndexedSubscript:(NSInteger)index{
    @autoreleasepool {
        if (index >= self.count || index < 0) {
            return nil;
        }
        return [self mutableObjectAtIndexedSubscript:index];
    }
}

- (void)mutableInsertObject:(id)object atIndex:(NSUInteger)index{
    if (object) {
        [self mutableInsertObject:object atIndex:index];
    }
}

@end

@implementation NSDictionary (Safe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSDictionaryM") swizzleMethod:@selector(setObject:forKey:) swizzledSelector:@selector(mutableSetObject:forKey:)];
            [objc_getClass("__NSPlaceholderDictionary") swizzleMethod:@selector(initWithObjects:forKeys:count:) swizzledSelector:@selector(dicInitWithObjects:forKeys:count:)];
        }
    });
}

- (void)mutableSetObject:(id)obj forKey:(NSString *)key{
    NSLog(@"mutableSetObject");
    if (obj && key) {
        [self mutableSetObject:obj forKey:key];
    }
}

- (instancetype)dicInitWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
    NSLog(@"dicInitWithObjects");
    if (objects && keys) {
        return [self dicInitWithObjects:objects forKeys:keys count:cnt];
    }
    else
    {
        return nil;
    }
}
@end
