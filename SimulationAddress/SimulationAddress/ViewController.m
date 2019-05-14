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
#import <AFNetworking/AFNetworking.h>

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

- (void)setupSearchBar{
    
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

#pragma mark - network
- (void)getSearchResult:(NSString *)string{
    //1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //http://120.25.226.186:32812/login?username=123&pwd=122&type=JSON
    //https://apis.map.qq.com/ws/place/v1/search?boundary=nearby(39.908491,116.374328,1000)&keyword=KFC&page_size=20&page_index=1&orderby=_distance&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77
    
    NSString *nearby = [NSString stringWithFormat:@"nearby(%.6f,%.6f,%.0f)",39.908491,116.374328,1000.0];
    NSDictionary *paramDict = @{
                                @"boundary":nearby,
                                @"page_size":@"20",
                                @"page_index":@"1",
                                @"keyword":string,
                                @"orderby":@"_distance",
                                @"key":@"LCPBZ-QMFKX-TFA4D-7EBQL-NDT56-F4B33",
                                };
    //2.发送GET请求
    /*
     第一个参数:请求路径(不包含参数).NSString
     第二个参数:字典(发送给服务器的数据~参数)
     第三个参数:progress 进度回调
     第四个参数:success 成功回调
     task:请求任务
     responseObject:响应体信息(JSON--->OC对象)
     第五个参数:failure 失败回调
     error:错误信息
     响应头:task.response
     */
    [manager GET:@"https://apis.map.qq.com/ws/place/v1/search" parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@---%@",[responseObject class],responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败--%@",error);
    }];
}

@end
