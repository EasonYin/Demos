//
//  BridgeRemote.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "BridgeAirConditioner.h"

NS_ASSUME_NONNULL_BEGIN

@interface BridgeRemote : NSObject
@property (nonatomic,strong)  BridgeAirConditioner *airConditioner;

//遥控器给空调发送指令
- (void)setCommand:(NSString *)command;
@end

NS_ASSUME_NONNULL_END
