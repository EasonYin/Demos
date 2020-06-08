//
//  Object_DViewController.h
//  DesignPatternDemo
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Object_DViewController : UIViewController
/*
 理解：高层模块不应该依赖低层模块，二者都应该依赖其抽象；抽象不应该依赖细节；细节应该依赖抽象。
 
 总结：面向接口编程，提取出事务的本质和共性。
 
 例子：我们给汽车加油，实现能够加90号的汽油，如果没有，就加93号的汽油。
 */
@end

NS_ASSUME_NONNULL_END
