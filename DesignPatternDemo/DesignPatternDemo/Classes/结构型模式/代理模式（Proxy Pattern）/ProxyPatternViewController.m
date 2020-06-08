//
//  ProxyPatternViewController.m
//  DesignPatternDemo
//
//        .
//  
//

#import "ProxyPatternViewController.h"
#import "ProxyRealImage.h"

@interface ProxyPatternViewController ()<ProxyImage>
{
    NSString *_fileName;
}
@end

@implementation ProxyPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _fileName = @"test_10mb.jpg";
    
    ProxyRealImage *image = [[ProxyRealImage alloc]initWithFileName:_fileName];
    
    [image display];
    
    image.delegate = self;

    if (image.delegate) {
        [image.delegate display];
    }
    
}

- (void)display
{
    NSLog(@"Delegate Displaying %@",_fileName);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
