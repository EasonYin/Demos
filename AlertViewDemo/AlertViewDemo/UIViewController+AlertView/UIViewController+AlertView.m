//
//  UIViewController+AlertView.m
//  ThriftShop
//
//

#import "UIViewController+AlertView.h"
#import "AlertController.h"

#define KEY_WINDOW [[UIApplication sharedApplication] keyWindow]

@implementation UIViewController(AlertView)

-(void)showAlertView:(NSString *)title
            subTitle:(NSString *)subTitle
     defaultBtnTitle:(NSString *)defaultBtnTitle
   defaultBtnHandler:(void(^)(void))defaultBtnHandler
      secondBtnTitle:(NSString *)secondBtnTitle
    secondBtnHandler:(void(^)(void))secondBtnHandler {

    AlertController *controller = [[AlertController alloc] init];
    
    controller.pic = @"";
    
    controller.mainTitle = title;
    controller.subTitle = subTitle;
    
    controller.defaultBtnTitle = defaultBtnTitle;
    controller.secondBtnTitle = secondBtnTitle;
    
    controller.firstHandler = defaultBtnHandler;
    controller.secondHandler = secondBtnHandler;

    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    controller.backViewController = self;

    [KEY_WINDOW addSubview:controller.view];
    [KEY_WINDOW.rootViewController addChildViewController:controller];
}


-(void)showAlertView:(NSString *)title
            subTitle:(NSString *)subTitle
     defaultBtnTitle:(NSString *)defaultBtnTitle
   defaultBtnHandler:(void(^)(void))defaultBtnHandler
      secondBtnTitle:(NSString *)secondBtnTitle
    secondBtnHandler:(void(^)(void))secondBtnHandler
              upLetf:(BOOL) upLetf {
    
    AlertController *controller = [[AlertController alloc] init];
    
    controller.pic = @"";
    
    controller.mainTitle = title;
    controller.subTitle = subTitle;
    
    controller.defaultBtnTitle = defaultBtnTitle;
    controller.secondBtnTitle = secondBtnTitle;
    
    controller.firstHandler = defaultBtnHandler;
    controller.secondHandler = secondBtnHandler;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    controller.backViewController = self;
   
    [KEY_WINDOW addSubview:controller.view];
    [controller updateUI];
    [KEY_WINDOW.rootViewController addChildViewController:controller];
}

-(void)showAlertViewWithPic:(NSString *)pic
                      title:(NSString *)title
            defaultBtnTitle:(NSString *)defaultBtnTitle
          defaultBtnHandler:(void(^)(void))defaultBtnHandler
             secondBtnTitle:(NSString *)secondBtnTitle
           secondBtnHandler:(void(^)(void))secondBtnHandler
{
    AlertController *controller = [[AlertController alloc] init];
    
    controller.pic = pic;
    
    controller.picWidth = 195;
    controller.picHeight = 118;
    
    controller.mainTitle = @"";
    controller.subTitle = title;
    
    controller.defaultBtnTitle = defaultBtnTitle;
    controller.secondBtnTitle = secondBtnTitle;
    
    controller.firstHandler = defaultBtnHandler;
    controller.secondHandler = secondBtnHandler;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    controller.backViewController = self;
    
    [KEY_WINDOW addSubview:controller.view];
    [KEY_WINDOW.rootViewController addChildViewController:controller];
}

-(void)showAlertView:(NSString *)title
            subTitle:(NSString *)subTitle
     defaultBtnTitle:(NSString *)defaultBtnTitle
   defaultBtnHandler:(void(^)(void))defaultBtnHandler
      secondBtnTitle:(NSString *)secondBtnTitle
    secondBtnHandler:(void(^)(void))secondBtnHandler
       dismissOpened:(BOOL)dismissOpened {
    
    AlertController *controller = [[AlertController alloc] init];
    
    controller.pic = @"";
    
    controller.dismissOpened = dismissOpened;
    
    controller.mainTitle = title;
    controller.subTitle = subTitle;
    
    controller.defaultBtnTitle = defaultBtnTitle;
    controller.secondBtnTitle = secondBtnTitle;
    
    controller.firstHandler = defaultBtnHandler;
    controller.secondHandler = secondBtnHandler;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    controller.backViewController = self;
    
    [KEY_WINDOW addSubview:controller.view];
    [KEY_WINDOW.rootViewController addChildViewController:controller];
}


-(void)showAlertViewWithPic:(NSString *)pic
                   PicWidth:(NSInteger)width
                  PicHeight:(NSInteger)height
                      title:(NSString *)title
            defaultBtnTitle:(NSString *)defaultBtnTitle
          defaultBtnHandler:(void(^)(void))defaultBtnHandler
             secondBtnTitle:(NSString *)secondBtnTitle
           secondBtnHandler:(void(^)(void))secondBtnHandler
{
    AlertController *controller = [[AlertController alloc] init];
    
    controller.pic = pic;
    
    controller.picWidth = width;
    controller.picHeight = height;
    
    controller.mainTitle = @"";
    controller.subTitle = title;
    
    controller.defaultBtnTitle = defaultBtnTitle;
    controller.secondBtnTitle = secondBtnTitle;
    
    controller.firstHandler = defaultBtnHandler;
    controller.secondHandler = secondBtnHandler;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    controller.backViewController = self;
    
    [KEY_WINDOW addSubview:controller.view];
    [KEY_WINDOW.rootViewController addChildViewController:controller];
}
@end

















