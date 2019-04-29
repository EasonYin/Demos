//
//  AppDelegate.m
//  MacSimulationAddress
//
//  Created by 尹华东 on 2019/4/29.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "AppDelegate.h"
#import <MapKit/MapKit.h>

@interface AppDelegate ()<CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    if (![CLLocationManager locationServicesEnabled]) {
        [self showAlert:@"去设置中允许此应用定位授权"];
    }
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 100;
    /**
     kCLLocationAccuracyBestForNavigation // 最适合导航
     kCLLocationAccuracyBest; // 最好的
     kCLLocationAccuracyNearestTenMeters; // 10m
     kCLLocationAccuracyHundredMeters; // 100m
     kCLLocationAccuracyKilometer; // 1000m
     kCLLocationAccuracyThreeKilometers; // 3000m
     */
    // 精确度越高, 越耗电, 定位时间越长
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


/**
 *  更新到位置之后调用
 *
 *  @param manager   位置管理者
 *  @param locations 位置数组
 */
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"定位到了");
    
    // 拿到位置,做一些业务逻辑操作
    CLLocation *location = locations.lastObject;
    
    // 打印位置信息
    NSLog(@"GCJ-02: 经度：%.6f, 纬度：%.6f", location.coordinate.longitude, location.coordinate.latitude);

    // 停止更新
    [manager stopUpdatingLocation];
}

/**
 *  授权状态发生改变时调用
 *
 *  @param manager 位置管理者
 *  @param status  状态
 */
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
            // 用户还未决定
        case kCLAuthorizationStatusNotDetermined:
        {
            NSLog(@"用户还未决定");
            
            break;
        }
            // 问受限
        case kCLAuthorizationStatusRestricted:
        {
            NSLog(@"访问受限");
            [self showAlert:@"去设置中允许此应用定位授权"];
            
            break;
        }
            // 定位关闭时和对此APP授权为never时调用
        case kCLAuthorizationStatusDenied:
        {
            // 定位是否可用（是否支持定位或者定位是否开启）
            if([CLLocationManager locationServicesEnabled])
            {
                NSLog(@"定位开启，但被拒");
            }else
            {
                NSLog(@"定位关闭，不可用");
            }
            //            NSLog(@"被拒");
            break;
        }
            // 获取前后台定位授权
        case kCLAuthorizationStatusAuthorizedAlways:
            //        case kCLAuthorizationStatusAuthorized: // 失效，不建议使用
        {
            NSLog(@"获取前后台定位授权");
            break;
        }
        default:
            break;
    }
}

- (void)showAlert:(NSString *)string{
    
    NSAlert *alert = [[NSAlert alloc]init];
    alert.messageText = string;
    [alert addButtonWithTitle:@"确定"];
    
    NSWindowController *window = [[NSStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialController];
    [alert beginSheetModalForWindow:window.window completionHandler:^(NSModalResponse returnCode) {
        
    }];
}

@end
