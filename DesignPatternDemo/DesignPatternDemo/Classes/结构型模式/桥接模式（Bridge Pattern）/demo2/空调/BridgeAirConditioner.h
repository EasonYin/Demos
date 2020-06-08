//
//  BridgeAirConditioner.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BridgeAirConditioner : NSObject

//空调接收命令
-  (void)loadCommand:(NSString *)command;
@end

NS_ASSUME_NONNULL_END
