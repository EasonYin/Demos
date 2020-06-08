//
//  FactoryPatternViewController.m
//  DesignPatternDemo
//
//

#import "FactoryPatternViewController.h"
#import "ShapeFactory.h"

@interface FactoryPatternViewController ()

@end

@implementation FactoryPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ShapeFactory *factory = [ShapeFactory new];
    
    Shape *shape0 = [factory getShape:(ShapeTypeNone)];
    [shape0 draw];
    
    Shape *shape1 = [factory getShape:(ShapeTypeRectangle)];
    [shape1 draw];
    
    Square *shape2 = (Square *)[factory getShape:(ShapeTypeSquare)];
    [shape2 draw];
    [shape2 squareMethod];

}


@end
