//
//  LayerViewController.m
//  layer_test
//
//

#import "LayerViewController.h"
#import "HDView.h"

@interface LayerViewController ()

@end

@implementation LayerViewController
- (void)dealloc{
    NSLog(@"LayerViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"LayerViewController";

    HDView *view = [[HDView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
    [self.view addSubview:view];
    
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
