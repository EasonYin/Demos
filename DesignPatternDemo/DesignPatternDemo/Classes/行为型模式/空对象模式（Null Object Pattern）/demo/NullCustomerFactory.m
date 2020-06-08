//
//  NullCustomerFactory.m
//  DesignPatternDemo
//
//        
//  
//

#import "NullCustomerFactory.h"
#import "NullRealCustomer.h"
#import "NullCustomer.h"

@implementation NullCustomerFactory

static NSArray *names;

+ (NullAbstractCustomer *)getgetCustomer:(NSString *)name
{
    if (names.count == 0) {
        names = @[@"Rob", @"Joe", @"Julie"];
    }
    
    if ([names containsObject:name]) {
        NullRealCustomer *customer = [[NullRealCustomer alloc]init];
        customer.name = name;
        return customer;
    }
    
    return [NullCustomer new];
}

@end
