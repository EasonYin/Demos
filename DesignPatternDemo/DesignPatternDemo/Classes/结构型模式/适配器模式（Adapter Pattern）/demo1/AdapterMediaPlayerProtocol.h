//
//  AdapterMediaPlay.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AdapterMediaPlayerProtocol <NSObject>

- (void)play:(NSString *)fileName audioType:(NSString *)audioType;

@end

NS_ASSUME_NONNULL_END
