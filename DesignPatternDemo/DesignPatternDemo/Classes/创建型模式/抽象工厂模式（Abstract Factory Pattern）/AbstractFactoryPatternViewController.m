//
//  AbstractFactoryPatternViewController.m
//  DesignPatternDemo
//
//


#import "AbstractFactoryPatternViewController.h"
#import "FactoryProducer.h"

@interface AbstractFactoryPatternViewController ()

@end

@implementation AbstractFactoryPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AbstractFactory *shapeFactory = [FactoryProducer getFactory:(FactoryTypeShape)];
    Shape *shape1 = [shapeFactory getShape:(ShapeTypeRectangle)];
    [shape1 draw];
    
    AbstractFactory *colorFactory = [FactoryProducer getFactory:(FactoryTypeColor)];
    Color *color1 = [colorFactory getColor:(ColorTypeGreen)];
    [color1 fill];
    
}

@end
