//
//  AdapterManager.m
//  DesignPatternDemo
//
//    
//  
//

#import "AdapterManager.h"

@interface AdapterManager ()

@property (nonatomic,strong) AdapterUSD *adapterUSD;

@end

@implementation AdapterManager

- (instancetype)initWithAdapter:(AdapterUSD *)adapter {
    self = [super init];
    if (self) {
        _adapterUSD = adapter;
    }
    return self;
}


- (float)getCNY {
    
    return [self.adapterUSD getUSD] * 6.6;
}

@end
