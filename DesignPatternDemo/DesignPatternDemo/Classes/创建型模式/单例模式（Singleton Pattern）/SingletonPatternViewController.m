//
//  SingletonPatternViewController.m
//  DesignPatternDemo
//
//


#import "SingletonPatternViewController.h"
#import "SingletonObject.h"

@interface SingletonPatternViewController ()

@end

@implementation SingletonPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SingletonObject *obj1 = [SingletonObject shareObject];
    NSLog(@"obj1:%@",obj1);
    
    SingletonObject *obj2 = [obj1 copy];
    NSLog(@"obj2:%@",obj2);
    
    SingletonObject *obj3 = [obj1 mutableCopy];
    NSLog(@"obj3:%@",obj3);
    
    SingletonObject *obj4 = [[SingletonObject alloc]init];
    NSLog(@"obj4:%@",obj4);
    
    SingletonObject *obj5 = [obj4 copy];
    NSLog(@"obj5:%@",obj5);
    
    SingletonObject *obj6 = [obj4 mutableCopy];
    NSLog(@"obj6:%@",obj6);
    
}


@end
