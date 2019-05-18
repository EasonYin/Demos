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

@protocol TXMapTapDelegate <NSObject>

- (void)doTapTXMapView:(id)sender;

@end

@interface TXMapViewController : ViewController<QMapViewDelegate>
@property (nonatomic,weak) id<TXMapTapDelegate> delegate;
@property (nonatomic, strong, readonly) QMapView *mapView;

@end

NS_ASSUME_NONNULL_END
