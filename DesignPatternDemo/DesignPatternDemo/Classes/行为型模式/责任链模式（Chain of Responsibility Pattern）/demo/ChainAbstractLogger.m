//
//  ChainAbstractLogger.m
//  DesignPatternDemo
//
//   
//  
//

#import "ChainAbstractLogger.h"

@implementation ChainAbstractLogger

- (void)setLevel:(ChainAbstractLoggerLevel)level
{
    _level = level;
}

- (void)setNextLogger:(ChainAbstractLogger *)nextLogger
{
    _nextLogger = nextLogger;
}

- (instancetype)initWithLevel:(ChainAbstractLoggerLevel)level
{
    self = [super init];
    if (self) {
        self.level = level;
    }
    return self;
}

- (void)logMessage:(ChainAbstractLoggerLevel)level message:(NSString *)message
{
    if (self.level <= level) {
        [self write:message];
    }
    
    if (self.nextLogger) {
        [self.nextLogger logMessage:level message:message];
    }
}

- (void)write:(NSString *)message
{
    NSLog(@"子类重写");
}

@end
