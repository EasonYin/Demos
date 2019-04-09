//
//  PreviewViewController.m
//  quickLook
//
//  Created by 尹华东 on 2018/10/29.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import "PreviewViewController.h"
#import <QuickLook/QuickLook.h>

@interface PreviewViewController () <QLPreviewingController>

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(NSString *)identifier queryString:(NSString * _Nullable)queryString completionHandler:(void (^)(NSError * _Nullable))handler {
    // Perform any setup necessary in order to prepare the view.
    
    // Call the completion handler so Quick Look knows that the preview is fully loaded.
    // Quick Look will display a loading spinner while the completion handler is not called.
    handler (nil);
}

/*
 * Implement this method if you support previewing files.
 * Add the supported content types to the QLSupportedContentTypes array in the Info.plist of the extension.
 *
- (void)preparePreviewOfFileAtURL:(NSURL *)url completionHandler:(void (^)(NSError * _Nullable))handler {
    handler(nil);
}
 */

@end
