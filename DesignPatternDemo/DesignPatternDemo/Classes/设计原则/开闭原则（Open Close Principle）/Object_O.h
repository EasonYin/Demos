//
//  Object_O.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaySendModel : NSObject

@property (nonatomic,strong) NSString *info;

@end

@protocol PayProcessor <NSObject>

- (void)handle:(PaySendModel *)model;

@end

@interface PayHelper : NSObject

@property (nonatomic,strong) id<PayProcessor> processors;
- (void)pay:(PaySendModel*)model;

@end

@interface AliPayProcessor : NSObject<PayProcessor>

@end

@interface WeChatPayProcessor : NSObject<PayProcessor>

@end

NS_ASSUME_NONNULL_END
