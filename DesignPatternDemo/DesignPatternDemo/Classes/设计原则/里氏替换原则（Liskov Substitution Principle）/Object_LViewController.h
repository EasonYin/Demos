//
//  Object_LViewController.h
//  DesignPatternDemo
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Object_LViewController : UIViewController
/*
 理解：一个对象在其出现的任何地方，都可以用子类实例做替换，并且不会导致程序的错误。换句话说，当子类可以在任意地方替换基类且软件功能不受影响时，这种继承关系的建模才是合理的。
 总结：子类可以扩展父类的方法，但不应该复写父类的方法。
 例子：我们定义汽车的基类，基类里面有行驶的方法，现在我们有个宝马车，宝马车继承汽车基类，也有行驶方法。现在我们想知道宝马车的行驶速度是多少，该怎么设计呢。
 
 */
@end

NS_ASSUME_NONNULL_END
