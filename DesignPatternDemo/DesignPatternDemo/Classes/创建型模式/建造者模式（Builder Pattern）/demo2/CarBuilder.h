//
//  CarBuilder.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CarCompanyProtocol <NSObject>

@required

- (void)buildCarBody:(NSString *)carBody;

- (void)buildEngine:(NSString *)engine;

- (void)buildTyre:(NSString *)tyre;

@end

@protocol CarBuilder <NSObject>

@required

- (id<CarBuilder>)buildCarBody:(NSString *)carBody;

- (id<CarBuilder>)buildEngine:(NSString *)engine;

- (id<CarBuilder>)buildTyre:(NSString *)tyre;

- (id<CarCompanyProtocol>)getCar;

@end

NS_ASSUME_NONNULL_END
