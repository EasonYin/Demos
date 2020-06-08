//
//  AdapterMediaPlayer.h
//  DesignPatternDemo
//
//    
//  
//

#import <Foundation/Foundation.h>
#import "AdapterMediaPlayerProtocol.h"
#import "AdapterAdvancedMediaPlayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdapterMediaPlayer : NSObject<AdapterMediaPlayerProtocol>

+ (instancetype)MediaAdapter:(NSString *)audioType;

@end

NS_ASSUME_NONNULL_END
