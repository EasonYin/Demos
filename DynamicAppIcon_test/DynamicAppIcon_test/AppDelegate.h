//
//  AppDelegate.h
//  DynamicAppIcon_test
//
//  Created by 尹华东 on 2018/10/25.
//  Copyright © 2018年 yinhuadong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

