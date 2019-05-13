//
//  SystemMapViewController.h
//  SimulationAddress
//
//  Created by 尹华东 on 2019/5/13.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SystemMapViewController : UIViewController
@property (strong, nonatomic,readonly) MKMapView *mapView;

@end

NS_ASSUME_NONNULL_END
