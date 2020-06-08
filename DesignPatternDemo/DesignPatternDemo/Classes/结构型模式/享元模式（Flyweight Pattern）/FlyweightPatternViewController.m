//
//  FlyweightPatternViewController.m
//  DesignPatternDemo
//
//        .
//  
//

#import "FlyweightPatternViewController.h"
#import "FlyweightShapeFactory.h"

@interface FlyweightPatternViewController ()
{
    NSArray *_colors;
}
@end

@implementation FlyweightPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _colors = @[@"Red", @"Green", @"Blue", @"White", @"Black"];
    
    for (int i = 0; i < 20; i ++) {
        FlyweightCircle *circle = [FlyweightShapeFactory getCircle:[self getRandomColor]];
        [circle setX:[self getRandomX]];
        [circle setY:[self getRandomY]];
        [circle setRadius:100];
        [circle draw];
    }
}

- (NSString *)getRandomColor
{
    int index = (int)(arc4random()%_colors.count);
    return _colors[index];
}

- (int)getRandomX
{
    int index = arc4random()%100;
    return index;
}

- (int)getRandomY
{
    int index = arc4random()%100;
    return index;
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
