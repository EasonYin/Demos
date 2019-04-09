//
//  UIViewController+AlertView.h
//  ThriftShop
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertView)

//一般文字提示使用

/*@title            弹出框主标题（第一行）
 *@subTitle         弹出框副标题（第二行）
 *@defaultBtnTitle  默认button（绿色）文字
 *@defaultBtnHander 默认button点击响应block
 *@secondBtnTitle   第二个button文字
 *@secondBtnHandler 第二个button点击响应block
 */
-(void)showAlertView:(NSString *)title
            subTitle:(NSString *)subTitle
     defaultBtnTitle:(NSString *)defaultBtnTitle
   defaultBtnHandler:(void(^)(void))defaultBtnHandler
      secondBtnTitle:(NSString *)secondBtnTitle
    secondBtnHandler:(void(^)(void))secondBtnHandler;



-(void)showAlertView:(NSString *)title
            subTitle:(NSString *)subTitle
     defaultBtnTitle:(NSString *)defaultBtnTitle
   defaultBtnHandler:(void(^)(void))defaultBtnHandler
      secondBtnTitle:(NSString *)secondBtnTitle
    secondBtnHandler:(void(^)(void))secondBtnHandler
              upLetf:(BOOL) upLetf;

//弹框有图片时候使用

/*@pic              图片名称
 *@title            弹出框主标题（第一行）
 *@defaultBtnTitle  默认button（绿色）文字
 *@defaultBtnHander 默认button点击响应block
 *@secondBtnTitle   第二个button文字
 *@secondBtnHandler 第二个button点击响应block
 */
-(void)showAlertViewWithPic:(NSString *)pic
                      title:(NSString *)title
            defaultBtnTitle:(NSString *)defaultBtnTitle
          defaultBtnHandler:(void(^)(void))defaultBtnHandler
             secondBtnTitle:(NSString *)secondBtnTitle
           secondBtnHandler:(void(^)(void))secondBtnHandler;



//是否可以点击背景后使弹框消失

/*@title            弹出框主标题（第一行）
 *@subTitle         弹出框副标题（第二行）
 *@defaultBtnTitle  默认button（绿色）文字
 *@defaultBtnHander 默认button点击响应block
 *@secondBtnTitle   第二个button文字
 *@secondBtnHandler 第二个button点击响应block
 *@dismiss          点击背景是否消失
 */
-(void)showAlertView:(NSString *)title
            subTitle:(NSString *)subTitle
     defaultBtnTitle:(NSString *)defaultBtnTitle
   defaultBtnHandler:(void(^)(void))defaultBtnHandler
      secondBtnTitle:(NSString *)secondBtnTitle
    secondBtnHandler:(void(^)(void))secondBtnHandler
       dismissOpened:(BOOL)dismissOpened;

//弹框有图片时候使用

/*@pic              图片名称
 *@width            图片宽度
 *@height           图片高度
 *@title            弹出框主标题（第一行）
 *@defaultBtnTitle  默认button（绿色）文字
 *@defaultBtnHander 默认button点击响应block
 *@secondBtnTitle   第二个button文字
 *@secondBtnHandler 第二个button点击响应block
 */

-(void)showAlertViewWithPic:(NSString *)pic
                   PicWidth:(NSInteger)width
                  PicHeight:(NSInteger)height
                      title:(NSString *)title
            defaultBtnTitle:(NSString *)defaultBtnTitle
          defaultBtnHandler:(void(^)(void))defaultBtnHandler
             secondBtnTitle:(NSString *)secondBtnTitle
           secondBtnHandler:(void(^)(void))secondBtnHandler;
@end










