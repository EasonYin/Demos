//
//  Item.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Packing <NSObject>
@property (nonatomic, copy)NSString  *pack;
@end

@protocol Item <NSObject>

@property (nonatomic, copy)NSString  *name;

@property (nonatomic, copy)id<Packing> packing;

@property (nonatomic, assign)float  price;

@end

NS_ASSUME_NONNULL_END
