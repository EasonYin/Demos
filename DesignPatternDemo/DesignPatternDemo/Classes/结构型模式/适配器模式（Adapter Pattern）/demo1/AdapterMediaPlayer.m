//
//  AdapterMediaPlayer.m
//  DesignPatternDemo
//
//    
//  
//

#import "AdapterMediaPlayer.h"

@interface AdapterMediaPlayer ()

@property (nonatomic,strong) AdapterAdvancedMediaPlayer *advancedMusicPlayer;

@end

@implementation AdapterMediaPlayer

+ (instancetype)MediaAdapter:(NSString *)audioType{
    
    AdapterMediaPlayer *player = [AdapterMediaPlayer new];
    
    if ([audioType isEqualToString:@"vlc"]) {
        player.advancedMusicPlayer = [VlcPlayer new];
    }
    else if ([audioType isEqualToString:@"mp4"]){
        player.advancedMusicPlayer = [Mp4Player new];
    }
    
    return player;
}

- (void)play:(NSString *)fileName audioType:(NSString *)audioType{
    if ([audioType isEqualToString:@"vlc"]) {
        [_advancedMusicPlayer playVlc:fileName];
    }
    else if ([audioType isEqualToString:@"mp4"]){
        [_advancedMusicPlayer playMp4:fileName];
    }
}

@end
