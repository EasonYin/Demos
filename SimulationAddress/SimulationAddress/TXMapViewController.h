//
//  TXMapViewController.h
//  SimulationAddress
//
//  Created by EasonYin on 2019/5/11.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import <QMapKit/QMapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXMapViewController : ViewController<QMapViewDelegate>
@property (nonatomic, strong, readonly) QMapView *mapView;

@end

NS_ASSUME_NONNULL_END
