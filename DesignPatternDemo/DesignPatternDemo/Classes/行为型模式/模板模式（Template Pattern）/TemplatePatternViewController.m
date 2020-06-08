//
//  TemplatePatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "TemplatePatternViewController.h"
#import "TemplateCricket.h"
#import "TemplateFootball.h"
#import "TemplateGame.h"

@interface TemplatePatternViewController ()

@end

@implementation TemplatePatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TemplateGame *game = [TemplateCricket new];
    [game play];
    game = [TemplateFootball new];
    [game play];
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
