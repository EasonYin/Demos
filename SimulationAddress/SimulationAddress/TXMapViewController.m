//
//  TXMapViewController.m
//  SimulationAddress
//
//  Created by EasonYin on 2019/5/11.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import "TXMapViewController.h"
#import "AddressManager.h"

@interface TXMapViewController ()
@property (nonatomic, strong, readwrite) QMapView *mapView;

@end

@implementation TXMapViewController

- (void)handleTestAction
{
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate];
}

- (NSString *)testTitle
{
    return @"我的位置";
}

#pragma mark - Setup

- (void)setupNavigationBar
{
    self.navigationController.navigationBar.translucent = NO;
    
    UIBarButtonItem *testItem = [[UIBarButtonItem alloc] initWithTitle:[self testTitle]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(handleTestAction)];
    self.navigationItem.rightBarButtonItem = testItem;
}

- (QMapView *)mapView{
    if (!_mapView) {
        _mapView = [[QMapView alloc] initWithFrame:self.view.bounds];
        _mapView.delegate = self;
        
        _mapView.zoomLevel = 15;
        _mapView.rotateEnabled = NO;
        _mapView.overlookingEnabled = NO;
        _mapView.userTrackingMode = QUserTrackingModeFollow;
        _mapView.showsUserLocation = YES;
    }
    return _mapView;
}

- (void)setupMapView
{
    
    [self.view addSubview:self.mapView];

}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigationBar];
    
    [self setupMapView];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(respondsToGesture:)];
    [self.mapView addGestureRecognizer:longPress];

}

#pragma mark - UILongPressGestureRecognizer
- (void)respondsToGesture:(UILongPressGestureRecognizer *)gesture {
    // 当长按手势开始时，添加一个标注数据源
    if (gesture.state == UIGestureRecognizerStateBegan) {
        // 获取用户长按手势在地图上的点
        CGPoint point = [gesture locationInView:self.mapView];
        // 将地图上的点转化为经纬度
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
        // 创建一个标注数据源，这里使用系统标注数据源：MKPointAnnotation,如果要自定义,必须遵守<MKAnnotation>协议

        QPointAnnotation *annotation = [[QPointAnnotation alloc] init];
        annotation.coordinate = coordinate;
        annotation.title = @"标注位置";
        annotation.subtitle = [NSString stringWithFormat:@"经度：%.2f, 纬度：%.2f", coordinate.longitude, coordinate.latitude];

        [self.mapView addAnnotation:annotation];

        [[AddressManager shared] setGPXwithLocation:coordinate];

    }
}

#pragma mark - QMapViewDelegate

- (void)mapViewWillStartLocatingUser:(QMapView *)mapView
{
//    NSLog(@"%s", __FUNCTION__);
}

- (void)mapViewDidStopLocatingUser:(QMapView *)mapView
{
//    NSLog(@"%s", __FUNCTION__);
}

/**
 * @brief 用户位置更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 新的用户位置
 * @param fromHeading 是否为heading 变化触发，如果为location变化触发,则为NO
 */
- (void)mapView:(QMapView *)mapView didUpdateUserLocation:(QUserLocation *)userLocation fromHeading:(BOOL)fromHeading
{
//    NSLog(@"%s fromHeading = %d, location = %@, heading = %@", __FUNCTION__, fromHeading, userLocation.location, userLocation.heading);

}

/**
 * @brief  定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(QMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
//    NSLog(@"%s error = %@", __FUNCTION__, error);
}

/**
 * @brief 定位时的userTrackingMode 改变时delegate调用此函数
 *  @param mapView 地图View
 *  @param mode QMUserTrackingMode
 *  @param animated 是否有动画
 */
- (void)mapView:(QMapView *)mapView didChangeUserTrackingMode:(QUserTrackingMode)mode animated:(BOOL)animated
{
//    NSLog(@"%s mode = %d, animated = %d", __FUNCTION__, mode, animated);
}

- (void)mapView:(QMapView *)mapView regionDidChangeAnimated:(BOOL)animated gesture:(BOOL)bGesture{
    
    CGPoint point = mapView.center;
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
}

- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id<QAnnotation>)annotation
{
    if ([annotation isKindOfClass:[QPointAnnotation class]])
    {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        QPinAnnotationView *annotationView = (QPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        
        if (annotationView == nil)
        {
            annotationView = [[QPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
        }
        
//        annotationView.canShowCallout   = YES;

        // 可拖拽.
        annotationView.draggable = YES;
        
        // 开启下落动画
        annotationView.animatesDrop = YES;
        
//        UIImage *img = [UIImage imageNamed:@"marker"];
//        
//        annotationView.image = img;
//        annotationView.centerOffset = CGPointMake(0, -img.size.height / 2.0);
        
        return annotationView;
    }
    
    return nil;
}

- (void)mapView:(QMapView *)mapView didSelectAnnotationView:(QAnnotationView *)view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"腾讯地图" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];
    [alert addAction:[UIAlertAction actionWithTitle:@"输出标记" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [[AddressManager shared] setGPXwithLocation:view.annotation.coordinate];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"清除标记" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        [mapView removeAnnotation:view.annotation];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        [mapView deselectAnnotation:view.annotation animated:YES];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)mapView:(QMapView *)mapView annotationView:(QAnnotationView *)view didChangeDragState:(QAnnotationViewDragState)newState fromOldState:(QAnnotationViewDragState)oldState{
    
    [[AddressManager shared] setGPXwithLocation:view.annotation.coordinate];

}
@end
