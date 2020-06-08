//
//  ChainFileLogger.m
//  DesignPatternDemo
//
//   
//  
//

#import "ChainFileLogger.h"

@implementation ChainFileLogger

- (void)write:(NSString *)message
{
    NSLog(@"File::Logger: %@",message);
}
@end
