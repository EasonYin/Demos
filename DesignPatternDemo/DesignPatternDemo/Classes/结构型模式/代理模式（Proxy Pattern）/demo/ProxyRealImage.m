//
//  ProxyRealImage.m
//  DesignPatternDemo
//
//        .
//  
//

#import "ProxyRealImage.h"

@interface ProxyRealImage ()

@property (nonatomic,copy) NSString *fileName;

@end

@implementation ProxyRealImage

- (instancetype)initWithFileName:(NSString *)fileName
{
    self = [super init];
    if (self) {
        self.fileName = fileName;
        [self loadFromDisk:fileName];
    }
    return self;
}

- (void)display
{
    NSLog(@"Displaying %@",self.fileName);
}

- (void)loadFromDisk:(NSString *)fileName
{
    NSLog(@"Loading %@",fileName);
}
@end
