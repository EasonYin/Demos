//
//  ChainConsoleLogger.m
//  DesignPatternDemo
//
//   
//  
//

#import "ChainConsoleLogger.h"

@implementation ChainConsoleLogger

- (void)write:(NSString *)message
{
    NSLog(@"Standard Console::Logger: %@",message);
}

@end
