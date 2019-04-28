//
//  ViewController.m
//  SimulationAddress
//
//  Created by 尹华东 on 2019/4/28.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "AddressManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    [self.mapView showsUserLocation];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(respondsToGesture:)];
    [self.mapView addGestureRecognizer:longPress];

    [[AddressManager shared] parserGPX];
    
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
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];
    [alert addAction:[UIAlertAction actionWithTitle:@"设置虚拟位置" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [[AddressManager shared] setGPXwithLat:[NSString stringWithFormat:@"%.6f",view.annotation.coordinate.latitude] lon:[NSString stringWithFormat:@"%.6f",view.annotation.coordinate.longitude]];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"清除标记" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        [mapView removeAnnotation:view.annotation];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
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
