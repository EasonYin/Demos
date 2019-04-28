//
//  AddressManager.h
//  SimulationAddress
//
//  Created by 尹华东 on 2019/4/28.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressManager : NSObject
+ (AddressManager *)shared;
- (void)parserGPX;
- (void)setGPXwithLat:(NSString *)lat lon:(NSString *)lon;
@end

NS_ASSUME_NONNULL_END
