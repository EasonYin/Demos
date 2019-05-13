//
//  SystemMapViewController.m
//  SimulationAddress
//
//  Created by 尹华东 on 2019/5/13.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "SystemMapViewController.h"
#import "AddressManager.h"

@interface SystemMapViewController ()<MKMapViewDelegate>
@property (strong, nonatomic,readwrite) MKMapView *mapView;

@end

@implementation SystemMapViewController

- (MKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        _mapView.delegate = self;
        _mapView.rotateEnabled = NO;
        _mapView.userTrackingMode = MKUserTrackingModeFollow;
        _mapView.showsUserLocation = YES;
    }
    return _mapView;
}
- (void)setUpMapView{
    
    [self.view addSubview:self.mapView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpMapView];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(respondsToGesture:)];
    [self.mapView addGestureRecognizer:longPress];
    
}

#pragma mark - MKMapViewDelegate
// 1、用户位置发生改变时触发（第一次定位到用户位置也会触发该方法）
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
}

// 2、地图加载完成后触发
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    
}

// 3、显示大头针时触发，返回大头针视图，通常自定义大头针可以通过此方法进行
- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    return nil;
}

// 4、点击选中某个大头针时触发
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"系统地图" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];

    [alert addAction:[UIAlertAction actionWithTitle:@"清除标记" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        [mapView removeAnnotation:view.annotation];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        [mapView deselectAnnotation:view.annotation animated:YES];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

// 5、取消选中大头针时触发
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    
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
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        // 配置标注数据源
        annotation.coordinate = coordinate;
        annotation.title = @"标注位置";
        annotation.subtitle = [NSString stringWithFormat:@"经度：%.2f, 纬度：%.2f", coordinate.longitude, coordinate.latitude];
        // 在地图上添加标注
        [self.mapView addAnnotation:annotation];
    }
}

@end
