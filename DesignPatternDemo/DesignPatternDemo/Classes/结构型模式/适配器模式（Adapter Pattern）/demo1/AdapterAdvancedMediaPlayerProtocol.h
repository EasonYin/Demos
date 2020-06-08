//
//  AdapterAdvancedMediaPlayer.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AdapterAdvancedMediaPlayerProtocol <NSObject>

- (void)playVlc:(NSString *)fileName;
- (void)playMp4:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
