//
//  ChainAbstractLogger.h
//  DesignPatternDemo
//
//   
//  
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ChainAbstractLoggerLevel) {
    LEVELINFO = 1,
    LEVELDEBUG = 2,
    LEVELERROR = 3,
};

@interface ChainAbstractLogger : NSObject

@property (nonatomic,assign) ChainAbstractLoggerLevel level;
@property (nonatomic,strong) ChainAbstractLogger *nextLogger;

- (instancetype)initWithLevel:(ChainAbstractLoggerLevel)level;

- (void)logMessage:(ChainAbstractLoggerLevel)level message:(NSString *)message;

- (void)write:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
