//
//  Object_OViewController.h
//  DesignPatternDemo
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Object_OViewController : UIViewController
/*
 理解：类、模块、函数，可以去扩展，但不要去修改。如果要修改代码，尽量用继承或组合的方式来扩展类的功能，而不是直接修改类的代码。当然，如果能保证对整个架构不会产生任何影响，那就没必要搞的那么复杂，直接改这个类吧。
 总结：对软件实体的改动，最好用扩展而非修改的方式。
 例子：我们设计支付功能的时候，会用到不同的支付方式，我们可以选择在支付的时候使用判断支付条件然后使用不同的支付方式，然而这种设计真的好吗。如果我们添加了一个支付方法或者删除了一个支付方法是不是要改动pay方法的逻辑，那每一次的调整都要改动pay方法的逻辑是不是不合理了，依据开闭原则具体做法应该是设计扩展支付方式来实现不同的支付。
 
 */
@end

NS_ASSUME_NONNULL_END
