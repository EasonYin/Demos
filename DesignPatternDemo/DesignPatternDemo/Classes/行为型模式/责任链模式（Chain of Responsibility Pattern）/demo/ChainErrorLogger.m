//
//  ChainErrorLogger.m
//  DesignPatternDemo
//
//   
//  
//

#import "ChainErrorLogger.h"

@implementation ChainErrorLogger

- (void)write:(NSString *)message
{
    NSLog(@"Error Console::Logger: %@",message);
}
@end
