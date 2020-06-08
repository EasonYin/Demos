//
//  Object_IViewController.h
//  DesignPatternDemo
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Object_IViewController : UIViewController
/*
 理解：一个类实现的接口中，包含了它不需要的方法。将接口拆分成更小和更具体的接口，有助于解耦，从而更容易重构、更改。
 
 总结：对象不应被强迫依赖它不使用的方法。
 
 例子：我们定义一个汽车接口，要求实现run等方法。
 */
@end

NS_ASSUME_NONNULL_END
