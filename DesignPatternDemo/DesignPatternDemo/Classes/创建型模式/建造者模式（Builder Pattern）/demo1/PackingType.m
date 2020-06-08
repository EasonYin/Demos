//
//  PackingType.m
//  DesignPatternDemo
//
//      
//  
//

#import "PackingType.h"

@implementation Wrapper

- (NSString *)pack{
    return @"Wrapper";
}

@synthesize pack;

@end

@implementation Bottle

- (NSString *)pack{
    return @"Bottle";
}

@synthesize pack;

@end
