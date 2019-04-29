//
//  ViewController.m
//  MacSimulationAddress
//
//  Created by 尹华东 on 2019/4/29.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "EYLocationConverter.h"

@interface ViewController ()<MKMapViewDelegate,NSMenuDelegate>
@property (weak) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.mapView.showsUserLocation = YES;

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
    
    CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:view.annotation.coordinate];
    
    NSAlert *alert = [[NSAlert alloc]init];
    alert.messageText = [NSString stringWithFormat:@"lat=\"%.6f\" lon=\"%.6f\"",wgs84.latitude,wgs84.longitude];
    [alert addButtonWithTitle:@"确定"];
    
    NSWindowController *window = [[NSStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialController];
    [alert beginSheetModalForWindow:window.window completionHandler:^(NSModalResponse returnCode) {
        
    }];

}

// 5、取消选中大头针时触发
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
    
}

#pragma mark - MouseAction
- (void)rightMouseUp:(NSEvent *)event{
    NSLog(@"========鼠标右键========");
    NSLog(@"%@",NSStringFromPoint(event.locationInWindow));
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:event.locationInWindow toCoordinateFromView:self.view];
    NSLog(@"%f==%f",coordinate.latitude,coordinate.longitude);
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    // 配置标注数据源
    annotation.coordinate = coordinate;
    annotation.title = @"标注位置";
    annotation.subtitle = [NSString stringWithFormat:@"经度：%.6f, 纬度：%.6f", coordinate.longitude, coordinate.latitude];
    // 在地图上添加标注
    [self.mapView addAnnotation:annotation];
    
//    NSMenu * popupMenu = [[NSMenu alloc] initWithTitle:@"test"];
//    popupMenu.delegate = self;
//
//    NSMenuItem *item = [[NSMenuItem separatorItem] initWithTitle:@"添加大头钉" action:@selector(addAnnotationToMap:) keyEquivalent:@"111"];
//    [item setTarget:self];
//    [popupMenu addItem:item];
//    [NSMenu popUpContextMenu:popupMenu withEvent:event forView:self.mapView];
}


@end
