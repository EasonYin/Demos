//
//  AlertController.h
//  ThriftShop
//
//

#import <UIKit/UIKit.h>
#import "ESAlertView.h"
@interface AlertController : UIViewController<ESAlertViewButtonDelegate>

@property (nonatomic, strong) NSString *mainTitle;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *defaultBtnTitle;
@property (nonatomic, strong) NSString *secondBtnTitle;

@property (nonatomic, assign) NSInteger picWidth;
@property (nonatomic, assign) NSInteger picHeight;

@property (nonatomic, assign) BOOL dismissOpened;//

@property (nonatomic, strong) NSString *pic;

@property (nonatomic, copy) void(^firstHandler)(void);
@property (nonatomic, copy) void(^secondHandler)(void);

@property (nonatomic, weak) UIViewController* backViewController;
-(void)updateUI;
@end
