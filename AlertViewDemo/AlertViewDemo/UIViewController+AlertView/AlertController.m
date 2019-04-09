//
//  AlertController.m
//  ThriftShop
//
//

#import "AlertController.h"
#import "UIView+PPCategory.h"

#define SCREEN_WIDTH                    CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_HEIGHT                   CGRectGetHeight([[UIScreen mainScreen] bounds])

@implementation AlertController  {
    ESAlertView *contentView;
    UIView *backgoroundView;
    
    UIImageView *imageView;
    
    UIView *hLineView;
    UIView *vLineView;
    
    UIButton *firstButton;
    UIButton *secondButton;
    
    UILabel *firstLabel;
    UILabel *secondLabel;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    backgoroundView.alpha = 0.5;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [backgoroundView removeFromSuperview];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    backgoroundView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    [backgoroundView setBackgroundColor:[UIColor blackColor]];
    backgoroundView.alpha = 0.0;
    [self.view addSubview:backgoroundView];
    
    [self configSubView];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)]];
}

-(void)viewTap:(UITapGestureRecognizer*)tap{
    if (self.dismissOpened == YES) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }
}

-(void)configSubView {
    contentView = [[ESAlertView alloc] initWithFrame:CGRectZero];
    
    contentView.delegate = self;
    
    [contentView setViewData:self.mainTitle subTitle:self.subTitle defaultBtnTitle:self.defaultBtnTitle secondBtnTitle:self.secondBtnTitle pic:self.pic picWidth:self.picWidth picHeight:self.picHeight];
    
    contentView.frame = CGRectMake((SCREEN_WIDTH - contentView.width) / 2,
                                   (SCREEN_HEIGHT - contentView.height) / 2, contentView.width, contentView.height);
    
    //添加view
    [self.view addSubview:contentView];
}

- (void)firstButtonDelegate {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    if (self.firstHandler) {
        self.firstHandler();
    }
}

- (void)secondButtonDelegate {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    if (self.secondHandler) {
        self.secondHandler();
    }
}

-(void)updateUI{
    [contentView updateESUI];
}


@end
