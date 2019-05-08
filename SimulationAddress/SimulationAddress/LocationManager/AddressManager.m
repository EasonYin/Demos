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

@property (nonatomic, strong) NSString *xmlFilePath;
@property (nonatomic, strong) NSData *xmlData;
@property (nonatomic, strong) GDataXMLDocument *doc;

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

- (void)parserGPX{
    
//    NSData *tempXmlData = [self readFileData:@"test.gpx"];
//    if (!tempXmlData) {
//        self.xmlFilePath = [[NSBundle mainBundle] pathForResource:@"test.gpx" ofType:nil];
//        self.xmlData = [NSData dataWithContentsOfFile:self.xmlFilePath];
//    }
//    else{
        self.xmlFilePath = [[self GPXPath] stringByAppendingPathComponent:@"test.gpx"];
        self.xmlData = [self readFileData:@"test.gpx"];
//    }
    NSLog(@"FilePath: %@",self.xmlFilePath);
    
    //使用NSData对象初始化
    self.doc = [[GDataXMLDocument alloc] initWithData:self.xmlData error:nil];
    
    //获取根节点
    GDataXMLElement *rootElement = [self.doc rootElement];
    
    //获取根节点下的节点
    NSArray *wpts = [rootElement elementsForName:@"wpt"];
    
    for (GDataXMLElement *wpt in wpts) {
        
        NSString *lat = [[wpt attributeForName:@"lat"] stringValue];
        NSString *lon = [[wpt attributeForName:@"lon"] stringValue];
        NSLog(@"文件中坐标 lon:%@==lat:%@",lon,lat);
    }
}

- (void)setGPXwithLocation:(CLLocationCoordinate2D)location{
    
    NSLog(@"设置前的坐标 lon:%.6f==lat:%.6f",location.longitude,location.latitude);

    //将坐标转换
    CLLocationCoordinate2D wgs84 = [EYLocationConverter gcj02ToWgs84:location];
    
    //<wpt lat="43.825972" lon="125.426993">
    NSString *showString = [NSString stringWithFormat:@"<wpt lat=\"%.6f\" lon=\"%.6f\">",wgs84.latitude,wgs84.longitude];
    NSLog(@"设置后的坐标:\n%@",showString);

    //获取根节点
    GDataXMLElement *rootElement = [self.doc rootElement];
    
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
    [self saveToDirectory:[self GPXPath] data:xmlData name:@"test.gpx"];
}

#pragma mark -
- (NSString *)GPXPath{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *path = [document stringByAppendingPathComponent:@"GPXFile"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager contentsOfDirectoryAtPath:path error:nil]){
        
        [manager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
        
    }
    return path;
}

- (NSData *)readFileData:(NSString *)fileName
{
    NSString *appFile = [[self GPXPath] stringByAppendingPathComponent:fileName];
    NSData *data = [[NSData alloc]initWithContentsOfFile:appFile];
    return data;
}

- (BOOL)saveToDirectory:(NSString *)path data:(NSData *)data name:(NSString *)newName
{
    NSString * resultPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",newName]];
    return [[NSFileManager defaultManager] createFileAtPath:resultPath contents:data attributes:nil];
}

@end
