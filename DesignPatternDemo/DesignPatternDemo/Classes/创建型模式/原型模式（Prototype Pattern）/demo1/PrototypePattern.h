//
//  PrototypePattern.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//原型角色
@protocol IProduct <NSObject>

@property (nonatomic,copy) NSString *name;

@end

@protocol IPrototype <NSObject>

- (id<IProduct>)clone;

@end

//具体原型角色
@interface ConcreteProduct : NSObject<IPrototype,IProduct>

@end

//使用者角色
@interface Client : NSObject

@property (nonatomic,strong) id<IPrototype> prototype;

- (id<IProduct>)operation;

@end

NS_ASSUME_NONNULL_END
