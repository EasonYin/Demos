//
//  ChainOfResponsibilityPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "ChainOfResponsibilityPatternViewController.h"
#import "ChainConsoleLogger.h"
#import "ChainErrorLogger.h"
#import "ChainFileLogger.h"
#import "ChainAbstractLogger.h"

@interface ChainOfResponsibilityPatternViewController ()

@end

@implementation ChainOfResponsibilityPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ChainAbstractLogger *loggerChain = [self getChainOfLoggers];
    
    [loggerChain logMessage:LEVELINFO message:@"This is an information."];
    [loggerChain logMessage:LEVELDEBUG message:@"This is a debug level information."];
    [loggerChain logMessage:LEVELERROR message:@"This is an error information."];

    
}

- (ChainAbstractLogger *)getChainOfLoggers
{
    ChainAbstractLogger *errorLogger = [[ChainErrorLogger alloc]initWithLevel:LEVELERROR];
    ChainAbstractLogger *fileLogger = [[ChainFileLogger alloc]initWithLevel:LEVELDEBUG];
    ChainAbstractLogger *consoleLogger = [[ChainConsoleLogger alloc]initWithLevel:LEVELINFO];
    
    errorLogger.nextLogger = fileLogger;
    fileLogger.nextLogger = consoleLogger;
    
    return errorLogger;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
