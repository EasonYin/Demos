//
//  EYQRCodeScanViewController.m
//  EYQRCodeTools
//
//  Created by 尹华东 on 2019/8/14.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import "EYQRCodeScanViewController.h"
#import "EYQRCodePreView.h"
#import "EYQRCodeManager.h"

#define EY_SCREEN_WIDTH                    CGRectGetWidth([[UIScreen mainScreen] bounds])
#define EY_SCREEN_HEIGHT                   CGRectGetHeight([[UIScreen mainScreen] bounds])
#define EY_NewStatusBarHeight              [[UIApplication sharedApplication] statusBarFrame].size.height
#define EY_NAVIGATION_BAR_HEIGHT           [JDBIPhoneGlobalConfig navagationBarHight]

@interface EYQRCodeScanViewController ()

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) EYQRCodePreView *previewView;
@property (nonatomic, strong) EYQRCodeManager *codeManager;

@end

@implementation EYQRCodeScanViewController

- (CGFloat)getNavBarHeight{
    UINavigationController *nav = nil;
    if ([[[[UIApplication sharedApplication]keyWindow]rootViewController] isKindOfClass:[UINavigationController class]]) {
        nav = (UINavigationController *)[[[UIApplication sharedApplication]keyWindow]rootViewController];
        return nav.navigationBar.frame.size.height;
    }
    else{
        nav = [[[[UIApplication sharedApplication]keyWindow]rootViewController]navigationController];
        return nav.navigationBar.frame.size.height;
    }
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, EY_NewStatusBarHeight, EY_SCREEN_WIDTH, [self getNavBarHeight])];
        [_topView setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:_topView];
    }
    return _topView;
}

- (void)setShowPhotoLibrary:(BOOL)showPhotoLibrary{
    _showPhotoLibrary = showPhotoLibrary;
    
    if (_showPhotoLibrary) {
//        UIBarButtonItem *photoItem = [[UIBarButtonItem alloc] initWithTitle:@"相册" style:UIBarButtonItemStylePlain target:self action:@selector(photo:)];
//        self.navigationItem.rightBarButtonItem = photoItem;
        
        UIButton *photoItem = [UIButton buttonWithType:UIButtonTypeCustom];
        photoItem.frame = CGRectMake(EY_SCREEN_WIDTH-60, 0, 60, [self getNavBarHeight]);
        [photoItem setTitle:@"相册" forState:(UIControlStateNormal)];
        [photoItem setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [photoItem.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [photoItem addTarget:self action:@selector(photo:) forControlEvents:UIControlEventTouchUpInside];
        [self.topView addSubview:photoItem];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    //设置导航栏背景图片为一个空的image，这样就透明了
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//
//    //去掉透明后导航栏下边的黑边
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

    [self startScanning];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];

}

//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
////    //    如果不想让其他页面的导航栏变为透明 需要重置
////    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
////    [self.navigationController.navigationBar setShadowImage:nil];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopBar];
    
    _previewView = [[EYQRCodePreView alloc] initWithFrame:self.view.bounds];
    _previewView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_previewView];
    
    __weak typeof(self) weakSelf = self;
    _codeManager = [[EYQRCodeManager alloc] initWithPreviewView:_previewView completion:^{
        [weakSelf startScanning];
    }];
}

- (void)setTopBar{
    
    [self.view bringSubviewToFront:self.topView];
    
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame = CGRectMake(0, 0, 60, [self getNavBarHeight]);
    [btnBack setImage:[UIImage imageNamed:@"ey_nav_back"] forState:(UIControlStateNormal)];
    [btnBack addTarget:self action:@selector(doBackBtn:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    [self.topView addSubview:btnBack];
    
}

- (void)setTitle:(NSString *)title{
    if (title.length > 0) {
        UILabel *titleLabel = [self.topView viewWithTag:101];
        if (!titleLabel) {
            titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, EY_SCREEN_WIDTH-120, [self getNavBarHeight])];
            titleLabel.textColor = [UIColor whiteColor];
            titleLabel.font = [UIFont systemFontOfSize:17];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.tag = 101;
            [self.topView addSubview:titleLabel];
        }
        
        titleLabel.text = title;
    }
}

- (void)doBackBtn:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Action functions

- (void)photo:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    [_codeManager presentPhotoLibraryWithRooter:self callback:^(NSString * _Nonnull code) {
        if ([weakSelf.delegate respondsToSelector:@selector(EYQRCodeScanViewController:didScanResult:)]) {
            [weakSelf.delegate EYQRCodeScanViewController:weakSelf didScanResult:code];
        }
    }];
}

#pragma mark - Private functions

- (void)startScanning {
    
    __weak typeof(self) weakSelf = self;
    [_codeManager startScanningWithCallback:^(NSString * _Nonnull code) {
        if ([weakSelf.delegate respondsToSelector:@selector(EYQRCodeScanViewController:didScanResult:)]) {
            [weakSelf.delegate EYQRCodeScanViewController:weakSelf didScanResult:code];
        }
    } autoStop:YES];
}

@end
