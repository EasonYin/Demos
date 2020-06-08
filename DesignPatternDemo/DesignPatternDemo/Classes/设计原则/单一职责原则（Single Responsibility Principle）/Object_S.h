//
//  Object_S.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WaitPayList : NSObject
//待支付
@end

@interface WaitGoodsList : NSObject
//待收货
@end

@interface ReceivedGoodsList : NSObject
//已收货
@end

@interface OrderList : NSObject
//订单列表
@property (nonatomic,strong) WaitPayList *waitPayList;
@property (nonatomic,strong) WaitGoodsList *waitGoodsList;
@property (nonatomic,strong) ReceivedGoodsList *receivedGoodsList;

@end

NS_ASSUME_NONNULL_END
