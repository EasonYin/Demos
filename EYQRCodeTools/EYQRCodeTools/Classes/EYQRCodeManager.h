//
//  EYQRCodeManager.h
//  EYQRCodeTools
//
//  Created by 尹华东 on 2019/8/14.
//  Copyright © 2019 yinhuadong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class EYQRCodePreView;

@interface EYQRCodeManager : NSObject

#pragma mark - 扫描二维码/条形码
- (instancetype)initWithPreviewView:(EYQRCodePreView *)previewView completion:(void(^)(void))completion;

- (void)startScanningWithCallback:(void(^)(NSString *))callback autoStop:(BOOL)autoStop;
- (void)startScanningWithCallback:(void(^)(NSString *))callback;
- (void)stopScanning;

- (void)presentPhotoLibraryWithRooter:(UIViewController *)rooter callback:(void(^)(NSString *))callback;

#pragma mark - 生成二维码/条形码
+ (UIImage *)generateQRCode:(NSString *)code size:(CGSize)size;
+ (UIImage *)generateQRCode:(NSString *)code size:(CGSize)size logo:(UIImage *)logo;
+ (UIImage *)generateCode128:(NSString *)code size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
