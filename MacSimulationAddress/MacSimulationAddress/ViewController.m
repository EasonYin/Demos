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

#define EYTableViewWidth (self.view.frame.size.width/3)

@interface ViewController ()<MKMapViewDelegate,NSTableViewDelegate,NSTableViewDataSource,NSAnimationDelegate>
@property (weak) IBOutlet MKMapView *mapView;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,strong) CLGeocoder *geoC;
@property (nonatomic,strong) NSScrollView *tableContainerView;
@property (nonatomic,strong) NSTableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (NSTableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[NSTableView alloc]initWithFrame:CGRectMake(0, 0, EYTableViewWidth, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        //第一列
        NSTableColumn *column1 = [[NSTableColumn alloc] initWithIdentifier:@"columnFrist"];
        column1.title = @"搜索结果";
        [column1 setWidth:EYTableViewWidth];
        [_tableView addTableColumn:column1];
        
        NSScrollView *tableContainerView = [[NSScrollView alloc] initWithFrame:CGRectMake(-EYTableViewWidth, 0, EYTableViewWidth, self.view.frame.size.height)];
        
        tableContainerView.backgroundColor = [NSColor redColor];
        [tableContainerView setDocumentView:_tableView];
        [tableContainerView setDrawsBackground:NO];//不画背景（背景默认画成白色）
        [tableContainerView setHasVerticalScroller:YES];//有垂直滚动条
        tableContainerView.autohidesScrollers = YES;//自动隐藏滚动条（滚动的时候出现）
        self.tableContainerView = tableContainerView;
        
        [self.view addSubview:self.tableContainerView];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.geoC = [[CLGeocoder alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findMe:) name:@"findMe" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchText:) name:@"searchText" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearSearchText:) name:@"clearSearchText" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeMapShowType:) name:@"segmentControl" object:nil];
}

#pragma mark - MKMapViewDelegate
// 1、用户位置发生改变时触发（第一次定位到用户位置也会触发该方法）
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
//    [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];
//    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 10000, 10000) animated:YES];

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

        //中间
        NSTextView *text = [[NSTextView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
        text.backgroundColor = [NSColor clearColor];
        CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:annotation.coordinate];
        text.string = [NSString stringWithFormat:@"lat=\"%.6f\" lon=\"%.6f\"",wgs84.latitude,wgs84.longitude];
        customPinView.detailCalloutAccessoryView = text;
//        customPinView.detailCalloutAccessoryView = nil;

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
    
    [self addAnnotaionWithCoordinate:self.coordinate title:@"标注位置"];
    
}

- (void)addAnnotaionWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title{
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    // 配置标注数据源
    annotation.coordinate = coordinate;
    
    // 创建CLLocation对象
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    // 根据CLLocation对象进行反地理编码
    [self.geoC reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * __nullable placemarks, NSError * __nullable error) {
        // 包含区，街道等信息的地标对象
        CLPlacemark *placemark = [placemarks firstObject];
        
        // 全称
        NSString *name = placemark.name;
        if (name.length != 0) {
            annotation.title = name;
        }else{
            annotation.title = title;
        }
        annotation.subtitle = [NSString stringWithFormat:@"经度：%.6f, 纬度：%.6f", coordinate.longitude, coordinate.latitude];
        
    }];
    
    
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

#pragma mark - notifacation
- (void)findMe:(id)sender{
    NSLog(@"Find Me!");
    
    [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 3000, 3000) animated:YES];

}

- (void)searchText:(NSNotification *)notification{
    
    NSString *string = nil;
    if ([notification.object isKindOfClass:[NSString class]]) {
        string = notification.object;
    }
    NSLog(@"searchText:%@",notification.object);
    
    //当传入的值为0时直接返回
    if ([string length] == 0) {
        return;
    }
    
    // 地理编码方案一：直接根据地址进行地理编码（返回结果可能有多个，因为一个地点有重名）
    [self.geoC geocodeAddressString:string completionHandler:^(NSArray<CLPlacemark *> * __nullable placemarks, NSError * __nullable error) {
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:placemarks];
        [self.tableView reloadData];
        [self showTableView];
        
    }];
    
}

- (void)clearSearchText:(NSNotification *)notification{
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    [self.dataArray removeAllObjects];
    [self hideTableView];
    
}

- (void)changeMapShowType:(NSNotification *)notification{
    
    NSLog(@"changeMapShowType:%@",notification.object);
    NSInteger selectType = ((NSNumber*)notification.object).integerValue;
    
    if (selectType == 0) {
        //普通
        self.mapView.mapType = MKMapTypeStandard;
        self.mapView.showsTraffic = YES;
        self.mapView.showsBuildings = YES;
    }
    else if (selectType == 1){
        //卫星
        self.mapView.mapType = MKMapTypeHybridFlyover;
    }
}

#pragma mark - tableView
- (void)showTableView{
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        [context setDuration:0.2f];
        [[self.tableContainerView animator] setFrame:CGRectMake(0, 0, EYTableViewWidth, self.view.frame.size.height)];
    } completionHandler:^{
        NSLog(@"All done!");
    }];
}

- (void)hideTableView{
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        [context setDuration:0.2f];
        [[self.tableContainerView animator] setFrame:CGRectMake(-EYTableViewWidth, 0, EYTableViewWidth, self.view.frame.size.height)];
    } completionHandler:^{
        NSLog(@"All done!");
    }];
}

//返回行数
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return self.dataArray.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    CLPlacemark *placeItem = (CLPlacemark *)(self.dataArray[row]);
    
    CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:placeItem.location.coordinate];
    NSString *showString = [NSString stringWithFormat:@"%@\n纬度：\"%.6f\" 经度：\"%.6f\"",placeItem.name,wgs84.latitude,wgs84.longitude];
    return showString;
    
}

#pragma mark - 行高
-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 44;
}

#pragma mark - 是否可以选中单元格
//选中的响应
-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    
    NSTableView* tableView = notification.object;
    
    NSLog(@"didSelect：%zd",tableView.selectedRow);
    
    CLPlacemark *placeItem = (CLPlacemark *)(self.dataArray[tableView.selectedRow]);
    [self addAnnotaionWithCoordinate:placeItem.location.coordinate title:placeItem.name];
    [self.mapView setCenterCoordinate:placeItem.location.coordinate animated:YES];
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(placeItem.location.coordinate, 3000, 3000) animated:YES];

}

- (void)tableView:(NSTableView *)tableView mouseDownInHeaderOfTableColumn:(NSTableColumn *)tableColumn{
    [self hideTableView];
}
@end
