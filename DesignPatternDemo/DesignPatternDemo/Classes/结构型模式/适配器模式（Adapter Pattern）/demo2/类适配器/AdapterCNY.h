//
//  AdapterCNY.h
//  DesignPatternDemo
//
//    
//  
//

#import "AdapterUSD.h"
#import "MoneyAdapterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdapterCNY : AdapterUSD<MoneyAdapterProtocol>

@end

NS_ASSUME_NONNULL_END
