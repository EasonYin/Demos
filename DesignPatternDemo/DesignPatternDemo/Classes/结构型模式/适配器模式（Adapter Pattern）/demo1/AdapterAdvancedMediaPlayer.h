//
//  AdapterAdvancedMediaPlayer.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>
#import "AdapterAdvancedMediaPlayerProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface AdapterAdvancedMediaPlayer : NSObject<AdapterAdvancedMediaPlayerProtocol>

@end

@interface VlcPlayer : AdapterAdvancedMediaPlayer

@end

@interface Mp4Player : AdapterAdvancedMediaPlayer

@end

NS_ASSUME_NONNULL_END
