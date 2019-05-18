//
//  AddressManager.m
//  SimulationAddress
//
//  Created by 尹华东 on 2019/4/28.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "AddressManager.h"
#import "GDataXMLNode.h"

@interface AddressManager ()<NSXMLParserDelegate>

@end

@implementation AddressManager

AddressManager *addressManager = nil;
+ (AddressManager *)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        addressManager = [[AddressManager alloc]init];
    });
    return addressManager;
}

#pragma mark - PublicMethod
- (void)parserGPXWithFileName:(NSString *)fileName component:(NSString *)component{
    
    NSString *testFilePath = [self getGPXPathWithComponent:component];
    NSData *testData = [self readFileData:fileName path:testFilePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *testDoc = [[GDataXMLDocument alloc] initWithData:testData error:nil];
    
    //获取根节点
    GDataXMLElement *rootElement = [testDoc rootElement];
    
    //获取根节点下的节点
    NSArray *wpts = [rootElement elementsForName:@"wpt"];
    
    //打印
    for (GDataXMLElement *wpt in wpts) {
        
        NSString *lat = [[wpt attributeForName:@"lat"] stringValue];
        NSString *lon = [[wpt attributeForName:@"lon"] stringValue];
        NSLog(@"文件中坐标 lon:%@==lat:%@",lon,lat);
    }
    
}

- (void)editGPXFileWithLocation:(CLLocationCoordinate2D)wgs84 fileName:(NSString *)fileName path:(NSString *)path{
    
    NSData *testData = [self readFileData:fileName path:path];
    
    //使用NSData对象初始化
    GDataXMLDocument *testDoc = [[GDataXMLDocument alloc] initWithData:testData error:nil];
    
    //获取根节点
    GDataXMLElement *rootElement = [testDoc rootElement];
    
    //获取根节点下的节点
    NSArray *wpts = [rootElement elementsForName:@"wpt"];
    
    for (GDataXMLElement *wpt in wpts) {
        
        [[wpt attributeForName:@"lon"] setStringValue:[NSString stringWithFormat:@"%.6f", wgs84.longitude]];
        [[wpt attributeForName:@"lat"] setStringValue:[NSString stringWithFormat:@"%.6f", wgs84.latitude]];
        
    }
    
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithRootElement:rootElement];
    NSData *xmlData = [doc XMLData];
    //    NSString *xmlStrrss = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",xmlStrrss);
    [self saveToDirectory:path data:xmlData name:fileName];
}
    
- (void)saveNewLocation:(CLLocationCoordinate2D)location component:(NSString *)component{
    NSString *testFilePath = [self getGPXPathWithComponent:component];
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:testFilePath error:nil];
    
    CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:location];

    NSString *saveString = [NSString stringWithFormat:@"<?xml version=\"1.0\"?>\n  <gpx version=\"1.1\" creator=\"Xcode\">\n  <wpt lat=\"%.6f\" lon=\"%.6f\">\n  </wpt>\n</gpx>",wgs84.latitude,wgs84.longitude];
    NSData *testData = [saveString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *fileName = [NSString stringWithFormat:@"%zd.gpx",files.count];
    [self saveToDirectory:testFilePath data:testData name:fileName];
}
    
- (void)setGPXwithLocation:(CLLocationCoordinate2D)location{
    
    NSLog(@"\nGCJ-02坐标:\nlon:%.6f==lat:%.6f",location.longitude,location.latitude);

    //将坐标转换
    CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:location];
    
    NSString *showString = [NSString stringWithFormat:@"<wpt lat=\"%.6f\" lon=\"%.6f\">",wgs84.latitude,wgs84.longitude];
    NSLog(@"\nWGS-84坐标:\n%@",showString);

    
}
    
#pragma mark - privateMethod
- (NSString *)getGPXPathWithComponent:(NSString *)component{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *path = [document stringByAppendingPathComponent:component];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager contentsOfDirectoryAtPath:path error:nil]){
        
        [manager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
        
    }
    return path;
}

- (NSData *)readFileData:(NSString *)fileName path:(NSString *)path
{
    NSString *appFile = [path stringByAppendingPathComponent:fileName];
    NSData *data = [[NSData alloc]initWithContentsOfFile:appFile];
    return data;
}

- (BOOL)saveToDirectory:(NSString *)path data:(NSData *)data name:(NSString *)newName
{
    NSString * resultPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",newName]];
    return [[NSFileManager defaultManager] createFileAtPath:resultPath contents:data attributes:nil];
}

@end
