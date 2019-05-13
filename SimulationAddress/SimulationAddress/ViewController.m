//
//  ViewController.m
//  SimulationAddress
//
//  Created by 尹华东 on 2019/4/28.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"
#import "SystemMapViewController.h"
#import "TXMapViewController.h"
#import <MapKit/MapKit.h>
#import <QMapKit/QMapKit.h>
#import "AddressManager.h"

typedef NS_ENUM(NSUInteger, EYShowMapType) {
    EYShowMapTypeSystemMap,
    EYShowMapTypeTxMap,
    EYShowMapTypeOther,
};

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property (nonatomic,assign) EYShowMapType showMapType;

@property (nonatomic,strong) UIView *mapView;
@property (nonatomic,strong) SystemMapViewController *systemMapViewController;
@property (nonatomic,strong) TXMapViewController *txMapViewController;

@end

@implementation ViewController

- (SystemMapViewController *)systemMapViewController{
    if (!_systemMapViewController) {
        _systemMapViewController = [[SystemMapViewController alloc]init];
        
    }
    return _systemMapViewController;
}

- (TXMapViewController *)txMapViewController{
    if (!_txMapViewController) {
        _txMapViewController = [[TXMapViewController alloc]init];
    }
    return _txMapViewController;
}

- (IBAction)segmentChange:(UISegmentedControl *)sender {
    
    self.showMapType = (EYShowMapType)sender.selectedSegmentIndex;
    
    [self setUpMapView];
    
}

- (void)setUpMapView
{
    [self.mapView removeFromSuperview];
    
    switch (self.showMapType) {
        case EYShowMapTypeSystemMap:
        {
            [self addChildViewController:self.systemMapViewController];
            self.mapView = self.systemMapViewController.mapView;
            [self.view addSubview:self.mapView];
            [self addGestureRecognizer];
        }
            break;
            
        case EYShowMapTypeTxMap:
        {
            [self addChildViewController:self.txMapViewController];
            self.mapView = self.txMapViewController.mapView;
            [self.view addSubview:self.mapView];
            [self addGestureRecognizer];
        }
            break;
            
        default:
            break;
    }
}

- (void)handleTestAction
{
    switch (self.showMapType) {
        case EYShowMapTypeSystemMap:
        {
            [(MKMapView *)self.mapView setCenterCoordinate:self.systemMapViewController.mapView.userLocation.location.coordinate];

        }
            break;
            
        case EYShowMapTypeTxMap:
        {
            [(QMapView *)self.mapView setCenterCoordinate:self.txMapViewController.mapView.userLocation.location.coordinate];
            
        }
            break;
            
        default:
            break;
    }
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"地图Demo";
    
    [self setupNavigationBar];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"EYShowMapType"]) {
        self.showMapType = ((NSNumber *)[[NSUserDefaults standardUserDefaults] valueForKey:@"EYShowMapType"]).integerValue;
    }
    
    [self setUpMapView];
    
}

#pragma mark - UILongPressGestureRecognizer
- (void)addGestureRecognizer{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(respondsToGesture:)];
    [self.mapView addGestureRecognizer:longPress];
}

- (void)respondsToGesture:(UILongPressGestureRecognizer *)gesture {
    // 当长按手势开始时，添加一个标注数据源
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        switch (self.showMapType) {
            case EYShowMapTypeSystemMap:
            {
                // 获取用户长按手势在地图上的点
                CGPoint point = [gesture locationInView:(MKMapView *)self.mapView];
                // 将地图上的点转化为经纬度
                CLLocationCoordinate2D coordinate = [(MKMapView *)self.mapView convertPoint:point toCoordinateFromView:(MKMapView *)self.mapView];
                // 创建一个标注数据源，这里使用系统标注数据源：MKPointAnnotation,如果要自定义,必须遵守<MKAnnotation>协议
                MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
                // 配置标注数据源
                annotation.coordinate = coordinate;
                annotation.title = @"标注位置";
                annotation.subtitle = [NSString stringWithFormat:@"经度：%.2f, 纬度：%.2f", coordinate.longitude, coordinate.latitude];
                // 在地图上添加标注
                [(MKMapView *)self.mapView addAnnotation:annotation];
                
                [[AddressManager shared] setGPXwithLocation:coordinate];

            }
                break;
                
            case EYShowMapTypeTxMap:
            {
                // 获取用户长按手势在地图上的点
                CGPoint point = [gesture locationInView:(QMapView *)self.mapView];
                // 将地图上的点转化为经纬度
                CLLocationCoordinate2D coordinate = [(QMapView *)self.mapView convertPoint:point toCoordinateFromView:(QMapView *)self.mapView];
                // 创建一个标注数据源，这里使用系统标注数据源：MKPointAnnotation,如果要自定义,必须遵守<MKAnnotation>协议
                
                QPointAnnotation *annotation = [[QPointAnnotation alloc] init];
                annotation.coordinate = coordinate;
                annotation.title = @"标注位置";
                annotation.subtitle = [NSString stringWithFormat:@"经度：%.2f, 纬度：%.2f", coordinate.longitude, coordinate.latitude];
                
                [(QMapView *)self.mapView addAnnotation:annotation];
                
                [[AddressManager shared] setGPXwithLocation:coordinate];

            }
                break;
                
            default:
                break;
        }
        
        
    }
}
@end
