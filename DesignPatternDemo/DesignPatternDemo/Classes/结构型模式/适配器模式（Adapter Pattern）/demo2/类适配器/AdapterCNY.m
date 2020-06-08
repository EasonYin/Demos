//
//  AdapterCNY.m
//  DesignPatternDemo
//
//    
//  
//

#import "AdapterCNY.h"

@implementation AdapterCNY

- (float)getCNY{
    return [self getUSD] * 6.6f;
}

@end
