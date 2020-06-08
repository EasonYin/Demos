//
//  CarDirector.h
//  DesignPatternDemo
//
//      
//  
//

#import <Foundation/Foundation.h>
#import "CarCompanyBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface CarDirector : NSObject

- (instancetype)initWithBuilder:(id<CarBuilder>)builder;

//获取想要的车
- (id<CarCompanyProtocol>)constructWithBody:(NSString *)carBody
                                  andEngine:(NSString *)engine
                                    andTyre:(NSString *)tyre;

@end

NS_ASSUME_NONNULL_END
