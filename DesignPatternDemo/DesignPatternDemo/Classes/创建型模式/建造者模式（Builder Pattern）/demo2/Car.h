//
//  Car.h
//  DesignPatternDemo
//
//

#import <Foundation/Foundation.h>
#import "CarBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject<CarCompanyProtocol>

@property (nonatomic,strong,readonly) NSString *carBody;
@property (nonatomic,strong,readonly) NSString *engine;
@property (nonatomic,strong,readonly) NSString *tyre;

@end

NS_ASSUME_NONNULL_END
