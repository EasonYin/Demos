//
//  AdapterAudioPlayer.m
//  DesignPatternDemo
//
//    
//  
//

#import "AdapterAudioPlayer.h"
#import "AdapterMediaPlayer.h"

@interface AdapterAudioPlayer ()

@property (nonatomic,strong) AdapterMediaPlayer *mediaAdapter;

@end

@implementation AdapterAudioPlayer

- (void)play:(NSString *)fileName audioType:(NSString *)audioType{
    
    if ([audioType isEqualToString:@"mp3"]) {
        NSLog(@"Playing mp3 file. Name: %@",fileName);
    }
    else if ([audioType isEqualToString:@"vlc"] || [audioType isEqualToString:@"mp4"]){
        _mediaAdapter = [AdapterMediaPlayer MediaAdapter:audioType];
        [_mediaAdapter play:fileName audioType:audioType];
    }
    else{
        NSLog(@"Invalid media. %@ format not supported",audioType);
    }
    
}

@end
