//
//  AdapterAdvancedMediaPlayer.m
//  DesignPatternDemo
//
//    
//  
//

#import "AdapterAdvancedMediaPlayer.h"

@implementation AdapterAdvancedMediaPlayer

- (void)playVlc:(NSString *)fileName{
    return;
}

- (void)playMp4:(NSString *)fileName{
    return;
}

@end

@implementation VlcPlayer

- (void)playVlc:(NSString *)fileName{
    NSLog(@"Playing vlc file. Name: %@",fileName);
}

- (void)playMp4:(NSString *)fileName{
    return;
}

@end

@implementation Mp4Player

- (void)playVlc:(NSString *)fileName{
    return;
}

- (void)playMp4:(NSString *)fileName{
    NSLog(@"Playing mp4 file. Name: %@",fileName);
}

@end
