//
//  EYQRCodePreView.h
//  EYQRCodeTools
//
//  Created by 尹华东 on 2019/8/14.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class EYQRCodePreView;
@protocol EYCodePreviewViewDelegate <NSObject>

- (void)codeScanningView:(EYQRCodePreView *)scanningView didClickedTorchSwitch:(UIButton *)switchButton;

@end

@interface EYQRCodePreView : UIView

@property (nonatomic, assign, readonly) CGRect rectFrame;
@property (nonatomic, weak) id<EYCodePreviewViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame rectFrame:(CGRect)rectFrame rectColor:(UIColor *)rectColor;
- (instancetype)initWithFrame:(CGRect)frame rectColor:(UIColor *)rectColor;
- (instancetype)initWithFrame:(CGRect)frame rectFrame:(CGRect)rectFrame;

- (void)startScanning;
- (void)stopScanning;
- (void)startIndicating;
- (void)stopIndicating;
- (void)showTorchSwitch;
- (void)hideTorchSwitch;

@end

NS_ASSUME_NONNULL_END
