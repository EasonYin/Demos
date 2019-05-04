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
#import <MASShortcut/Shortcut.h>

@interface ViewController ()<MKMapViewDelegate>
@property (weak) IBOutlet MKMapView *mapView;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
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
    
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        // Try to dequeue an existing pin view first.（这里跟UITableView的重用差不多）
        MKPinAnnotationView *customPinView = (MKPinAnnotationView*)[mapView
                                                                    dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!customPinView){
            // If an existing pin view was not available, create one.
            customPinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                            reuseIdentifier:@"CustomPinAnnotationView"];
        }
        //iOS9中用pinTintColor代替了pinColor
        customPinView.animatesDrop = YES;
        customPinView.canShowCallout = YES;
        
        //左边
        customPinView.leftCalloutAccessoryView = nil;
        
        //右边
        NSButton *btn = [NSButton buttonWithTitle:@"复制坐标" target:self action:@selector(copyAnnotation:)];
        customPinView.rightCalloutAccessoryView = btn;
//        customPinView.rightCalloutAccessoryView = nil;

        NSTextView *text = [[NSTextView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
        text.backgroundColor = [NSColor clearColor];
        CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:annotation.coordinate];
        text.string = [NSString stringWithFormat:@"lat=\"%.6f\" lon=\"%.6f\"",wgs84.latitude,wgs84.longitude];;
        customPinView.detailCalloutAccessoryView = text;
        
        return customPinView;
    }
    
    return nil;
}

// 4、点击选中某个大头针时触发
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    
    CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:view.annotation.coordinate];
    self.coordinate = wgs84;

//    NSAlert *alert = [[NSAlert alloc]init];
//    alert.messageText = [NSString stringWithFormat:@"lat=\"%.6f\" lon=\"%.6f\"",wgs84.latitude,wgs84.longitude];
//    [alert addButtonWithTitle:@"确定"];
//
//    NSWindowController *window = [[NSStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialController];
//    [alert beginSheetModalForWindow:window.window completionHandler:^(NSModalResponse returnCode) {
//
//    }];

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
    self.coordinate = coordinate;
    
    NSMenu *menu = [[NSMenu alloc]initWithTitle:@"Menu"];
    NSMenuItem * item1 = [[NSMenuItem alloc]initWithTitle:@"添加大头钉" action:@selector(addAnnotationToMapView:) keyEquivalent:@""];
    item1.target = self;
    [menu addItem:item1];
    [NSMenu popUpContextMenu:menu withEvent:event forView:self.view];
}

- (void)addAnnotationToMapView:(NSMenuItem *)sender{
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    // 配置标注数据源
    annotation.coordinate = self.coordinate;
    annotation.title = @"标注位置";
    annotation.subtitle = [NSString stringWithFormat:@"经度：%.6f, 纬度：%.6f", self.coordinate.longitude, self.coordinate.latitude];
    // 在地图上添加标注
    [self.mapView addAnnotation:annotation];
    
}

- (void)copyAnnotation:(NSButton *)sender{
    
    NSString *copyString = [NSString stringWithFormat:@"lat=\"%.6f\" lon=\"%.6f\"",self.coordinate.latitude,self.coordinate.longitude];
    
    NSPasteboard *aPasteboard = [NSPasteboard generalPasteboard]; //获取粘贴板对象
    [aPasteboard clearContents]; //清空粘贴板之前的内容
    NSData *aData = [copyString dataUsingEncoding:NSUTF8StringEncoding];
    [aPasteboard setData:aData forType:NSPasteboardTypeString];
    
}


@end
