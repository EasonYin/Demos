//
//  DecoratorPatternViewController.m
//  DesignPatternDemo
//
//      
//  
//

#import "DecoratorPatternViewController.h"
#import "DecoratorRedShapeDecorator.h"
#import "DecoratorCircle.h"
#import "DecoratorRectangle.h"

@interface DecoratorPatternViewController ()

@end

@implementation DecoratorPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DecoratorCircle *circle = [[DecoratorCircle alloc]init];
    DecoratorRectangle *rectangle = [[DecoratorRectangle alloc]init];
    
    DecoratorShapeDecorator *redCircle = [[DecoratorRedShapeDecorator alloc]init];
    redCircle.decoratedShape = circle;
    
    DecoratorShapeDecorator *redRectangle = [[DecoratorRedShapeDecorator alloc]init];
    redRectangle.decoratedShape = rectangle;

    NSLog(@"Circle with normal border");
    [circle draw];
    
    NSLog(@"Circle of red border");
    [redCircle draw];
    
    NSLog(@"Rectangle of red border");
    [redRectangle draw];
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
