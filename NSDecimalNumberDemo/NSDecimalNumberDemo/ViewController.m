//
//  ViewController.m
//  NSDecimalNumberDemo
//
//  Created by 尹华东 on 2019/9/3.
//  Copyright © 2019 EasonY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 四舍五入
    NSDecimalNumberHandler *roundPlain = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    {
        NSString *addStr = @"1.0";
        NSString *oneStr = @"1.114";
        NSString *twoStr = @"1.116";
        NSDecimalNumber *oneNum = [NSDecimalNumber decimalNumberWithString:oneStr];
        NSDecimalNumber *twoNum = [NSDecimalNumber decimalNumberWithString:twoStr];
        NSDecimalNumber *addNum = [NSDecimalNumber decimalNumberWithString:addStr];
        
        // 加法
        oneNum = [oneNum decimalNumberByAdding:addNum withBehavior:roundPlain];
        twoNum = [twoNum decimalNumberByAdding:addNum withBehavior:roundPlain];
        NSLog(@"\n1.114 + 1.0 （保留两位小数）四舍五入的结果为:%@\n1.116 + 1.0 （保留两位小数）四舍五入的结果为:%@", oneNum, twoNum);
    }
    
    // 向下取整
    NSDecimalNumberHandler *roundDown = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    {
        NSString *subtractStr = @"1.0";
        NSString *oneStr = @"1.114";
        NSString *twoStr = @"1.116";
        NSDecimalNumber *oneNum = [NSDecimalNumber decimalNumberWithString:oneStr];
        NSDecimalNumber *twoNum = [NSDecimalNumber decimalNumberWithString:twoStr];
        NSDecimalNumber *subtractNum = [NSDecimalNumber decimalNumberWithString:subtractStr];
        
        // 减法
        oneNum = [oneNum decimalNumberBySubtracting:subtractNum withBehavior:roundDown];
        twoNum = [twoNum decimalNumberBySubtracting:subtractNum withBehavior:roundDown];
        NSLog(@"\n1.114 - 1.0 （保留两位小数）向下取整的结果为:%@\n1.116 - 1.0 （保留两位小数）向下取整的结果为:%@", oneNum, twoNum);
    }
    
    // 在四舍五入的基础上，加上末尾数为5时，变成偶数的规则，例如小数点后两位， 1.215 时变为 1.22, 1.225 时变为 1.22
    NSDecimalNumberHandler *roundBankers = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    {
        NSString *dividStr = @"1.0";
        NSString *oneStr = @"1.115";
        NSString *twoStr = @"1.125";
        NSDecimalNumber *oneNum = [NSDecimalNumber decimalNumberWithString:oneStr];
        NSDecimalNumber *twoNum = [NSDecimalNumber decimalNumberWithString:twoStr];
        NSDecimalNumber *dividNum = [NSDecimalNumber decimalNumberWithString:dividStr];
        
        // 乘法
        oneNum = [oneNum decimalNumberByDividingBy:dividNum withBehavior:roundBankers];
        twoNum = [twoNum decimalNumberByDividingBy:dividNum withBehavior:roundBankers];
        NSLog(@"\n1.115 / 1.0 （保留两位小数）NSRoundBankers的结果为:%@\n1.125 / 1.0 （保留两位小数）NSRoundBankers的结果为:%@", oneNum, twoNum);
    }
    
}


@end
