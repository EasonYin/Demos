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
{
    BOOL navHidden;
    BOOL touchPhotoBtn;
}

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
        
        UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        btnBack.frame = CGRectMake(0, 0, 60, [self getNavBarHeight]);
        [btnBack setImage:[UIImage imageNamed:@"ey_nav_back"] forState:(UIControlStateNormal)];
        [btnBack addTarget:self action:@selector(doBackBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:btnBack];
        
    }
    return _topView;
}

- (EYQRCodePreView *)previewView{
    if (!_previewView) {
        _previewView = [[EYQRCodePreView alloc] initWithFrame:self.view.bounds];
        _previewView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_previewView addSubview:self.topView];
    }
    return _previewView;
}

- (EYQRCodeManager *)codeManager{
    if (!_codeManager) {
        __weak typeof(self) weakSelf = self;
        _codeManager = [[EYQRCodeManager alloc] initWithPreviewView:_previewView completion:^{
            [weakSelf startScanning];
        }];
    }
    return _codeManager;
}

- (void)setShowPhotoLibrary:(BOOL)showPhotoLibrary{
    _showPhotoLibrary = showPhotoLibrary;
    
    if (_showPhotoLibrary) {
        UIButton *photoItem = [UIButton buttonWithType:UIButtonTypeCustom];
        photoItem.frame = CGRectMake(EY_SCREEN_WIDTH-60, 0, 60, [self getNavBarHeight]);
        [photoItem setImage:[UIImage imageNamed:@"ey_nav_pic"] forState:(UIControlStateNormal)];
        [photoItem addTarget:self action:@selector(photo:) forControlEvents:UIControlEventTouchUpInside];
        [self.topView addSubview:photoItem];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (!navHidden) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
    
    touchPhotoBtn = NO;
    
    [self startScanning];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (!touchPhotoBtn && !navHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    navHidden = self.navigationController.navigationBarHidden;

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

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}

#pragma mark - Action functions

- (void)photo:(id)sender {
    
    touchPhotoBtn = YES;
    
    __weak typeof(self) weakSelf = self;
    [self.codeManager presentPhotoLibraryWithRooter:self callback:^(NSString * _Nonnull code) {
        if ([weakSelf.delegate respondsToSelector:@selector(EYQRCodeScanViewController:didScanResult:)]) {
            [weakSelf.delegate EYQRCodeScanViewController:weakSelf didScanResult:code];
        }
    }];
}

#pragma mark - Private functions

- (void)startScanning {
    
    if (!self.previewView.superview) {
        [self.view addSubview:self.previewView];
    }
    
    __weak typeof(self) weakSelf = self;
    [self.codeManager startScanningWithCallback:^(NSString * _Nonnull code) {
        if ([weakSelf.delegate respondsToSelector:@selector(EYQRCodeScanViewController:didScanResult:)]) {
            [weakSelf.delegate EYQRCodeScanViewController:weakSelf didScanResult:code];
        }
    } autoStop:YES];
}

@end
