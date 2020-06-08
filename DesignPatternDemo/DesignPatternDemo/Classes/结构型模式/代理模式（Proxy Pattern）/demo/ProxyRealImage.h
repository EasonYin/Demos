//
//  ProxyRealImage.h
//  DesignPatternDemo
//
//        .
//  
//

#import <Foundation/Foundation.h>
#import "ProxyImage.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProxyRealImage : NSObject<ProxyImage>

@property (nonatomic,weak) id<ProxyImage> delegate;

- (instancetype)initWithFileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
