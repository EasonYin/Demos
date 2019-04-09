//
//  ViewController.m
//  UncaughtExceptionDemo
//
//  Created by 尹华东 on 2019/4/9.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)doTap:(UITapGestureRecognizer *)sender{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *niltest = nil;
        
        NSArray *arr = @[niltest];
        
        NSLog(@"%@",arr);
        
    });
    
    
}

@end
