//
//  AddressManager.h
//  SimulationAddress
//
//  Created by 尹华东 on 2019/4/28.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EYLocationConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressManager : NSObject
+ (AddressManager *)shared;
    
- (void)parserGPXWithFileName:(NSString *)fileName component:(NSString *)component;
- (void)editGPXFileWithLocation:(CLLocationCoordinate2D)wgs84 fileName:(NSString *)fileName path:(NSString *)path;
    
- (void)saveNewLocation:(CLLocationCoordinate2D)location component:(NSString *)component;
- (void)setGPXwithLocation:(CLLocationCoordinate2D)location;
    
@end

NS_ASSUME_NONNULL_END
