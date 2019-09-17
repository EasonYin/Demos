//
//  AppDelegate.m
//  AppleLoginDemo
//
//  Created by 尹华东 on 2019/9/16.
//  Copyright © 2019 EasonY. All rights reserved.
//

#import "AppDelegate.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import <SSKeychain/SSKeychain.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc]init];
    NSString *userId = [SSKeychain passwordForService:ServerceName account:Account];
    
    [appleIDProvider getCredentialStateForUserID:userId completion:^(ASAuthorizationAppleIDProviderCredentialState credentialState, NSError * _Nullable error) {
        switch (credentialState){
            case ASAuthorizationAppleIDProviderCredentialAuthorized:
            {
                // The Apple ID credential is valid.
            }
                break;
            case ASAuthorizationAppleIDProviderCredentialRevoked:
            {
                // The Apple ID credential is revoked.
            }
                break;
            case ASAuthorizationAppleIDProviderCredentialNotFound:
            {
                // No credential was found, so show the sign-in UI.
            }
                break;
        }
    }];
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
