//
//  ViewController.m
//  SafeObjectDemo
//
//  Created by 尹华东 on 2020/6/3.
//  Copyright © 2020 EasonY. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Safe.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self nullTest];
    [self arrayTest];
//    [self marrayTest];
//    [self dicTest];
}

- (void)nullTest
{
    NSArray *nullArray = @[];
    NSLog(@"%@",nullArray[3]);
    NSLog(@"%@",[nullArray objectAtIndex:3]);
    NSLog(@"%@",[nullArray objectAtIndexedSubscript:3]);
}

- (void)arrayTest
{
    NSString *aa = nil;
    NSArray *array = @[@"1",@"2",aa];
    NSLog(@"%@",array[3]);
    NSLog(@"%@",[array objectAtIndex:3]);
    NSLog(@"%@",[array objectAtIndexedSubscript:3]);
}

- (void)marrayTest
{
    NSString *aa = nil;
    NSMutableArray *mArray = @[@"1",aa].mutableCopy;
    NSLog(@"%@",mArray[3]);
    NSLog(@"%@",[mArray objectAtIndex:3]);
    NSLog(@"%@",[mArray objectAtIndexedSubscript:3]);
    [mArray insertObject:nil atIndex:3];
    NSLog(@"%@",mArray);
}

- (void)dicTest
{
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    [mDic setObject:nil forKey:@"testKey"];
    NSLog(@"%@",mDic);
    
    NSString *aa = nil;
    NSDictionary *dic = @{@"a":aa};
    NSLog(@"%@",dic);
}

@end
