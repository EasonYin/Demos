//
//  AdapterManager.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>
#import "MoneyAdapterProtocol.h"
#import "AdapterUSD.h"
NS_ASSUME_NONNULL_BEGIN

@interface AdapterManager : NSObject<MoneyAdapterProtocol>

- (instancetype)initWithAdapter:(AdapterUSD *)adapter;

@end

NS_ASSUME_NONNULL_END
