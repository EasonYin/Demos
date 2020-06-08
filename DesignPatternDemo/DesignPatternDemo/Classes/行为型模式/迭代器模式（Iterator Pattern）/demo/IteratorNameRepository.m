//
//  IteratorNameRepository.m
//  DesignPatternDemo
//
//        
//  
//

#import "IteratorNameRepository.h"

NSArray *names;

@interface IteratorNameIterator : IteratorIterator
{
    int index;
}
@end

@implementation IteratorNameIterator

- (BOOL)hasNext
{
    if (index < names.count) {
        return true;
    }
    return false;
}

- (id)next
{
    if ([self hasNext]) {
        return names[index++];
    }
    return nil;
}

@end

@implementation IteratorNameRepository

- (instancetype)init
{
    self = [super init];
    if (self) {
        names = @[@"Robert" , @"John" ,@"Julie" , @"Lora"];
    }
    return self;
}

- (IteratorIterator *)getIterator
{
    IteratorNameIterator *nameIterator = [[IteratorNameIterator alloc]init];
    return nameIterator;
}

@end
