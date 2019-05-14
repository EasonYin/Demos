//
//  EYScreenShot.h
//  EYScreenShot
//
//  Created by 尹华东 on 2019/5/14.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^EYSystemScreenShotBlock)(void);

@interface EYScreenShot : NSObject

+ (EYScreenShot *)sharedEYScreenShot;

+ (void)registerSystemScreenShotNotificationWithBlock:(EYSystemScreenShotBlock)block;

- (UIImage *)imageWithScreenshot;

- (NSData *)saveToPhotoLibraryWithImage:(UIImage *)image;

+ (UIImage *)ey_WaterImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed;
+ (UIImage *)ey_WaterImageWithImage:(UIImage *)image waterImage:(UIImage *)waterImage waterImageRect:(CGRect)rect;

+ (UIImage *)coreGaussianBlurImage:(UIImage *)image  blurNumber:(CGFloat)blur;

@end

NS_ASSUME_NONNULL_END
