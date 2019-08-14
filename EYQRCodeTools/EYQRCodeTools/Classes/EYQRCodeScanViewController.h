//
//  EYQRCodeScanViewController.h
//  EYQRCodeTools
//
//  Created by 尹华东 on 2019/8/14.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class EYQRCodeScanViewController;
@protocol EYQRCodeScanViewControllerDelegate <NSObject>

-(void)EYQRCodeScanViewController:(EYQRCodeScanViewController *)VC didScanResult:(NSString *)result;

@end

@interface EYQRCodeScanViewController : UIViewController

@property (nonatomic, weak) id<EYQRCodeScanViewControllerDelegate> delegate;

@property (nonatomic,assign)BOOL showPhotoLibrary;

@end

NS_ASSUME_NONNULL_END
