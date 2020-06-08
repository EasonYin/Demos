//
//  Object_SViewController.m
//  DesignPatternDemo
//
//


#import "Object_SViewController.h"
#import "Object_S.h"

@interface Object_SViewController ()

@end

@implementation Object_SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OrderList *obj = [[OrderList alloc]init];
    NSLog(@"%@",obj.waitPayList);
    NSLog(@"%@",obj.waitGoodsList);
    NSLog(@"%@",obj.receivedGoodsList);

}



@end
