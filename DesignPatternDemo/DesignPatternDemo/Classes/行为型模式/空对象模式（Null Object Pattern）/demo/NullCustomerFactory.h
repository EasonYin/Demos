//
//  NullCustomerFactory.h
//  DesignPatternDemo
//
//        
//  
//

#import <Foundation/Foundation.h>
#import "NullAbstractCustomer.h"

NS_ASSUME_NONNULL_BEGIN

@interface NullCustomerFactory : NSObject

+ (NullAbstractCustomer *)getgetCustomer:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
