//
//  Object_CViewController.h
//  DesignPatternDemo
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Object_CViewController : UIViewController
/*
 理解：合成/聚合复用原则就是在一个新的对象里面使用一些已有的对象，使之成为新对象的一部分；新的对象通过向这些对象的委派达到复用已有功能的目的。它的设计原则是：要尽量使用合成/聚合，尽量不要使用继承。
 总结：就是说要少用继承，多用合成关系来实现。
 继承复用有一定的缺点：比如如果基类发生了改变，那么派生类的的实现就不得不发生改变；而且从超类继承而来的实现是静态的，不可能在运行时发生改变，因此它的灵活性差并最终会限制复用性。
 使用组合/聚合复用原则就解决了继承复用的缺点。
 
 
 */
@end

NS_ASSUME_NONNULL_END
