//
//  UIViewAnimationVC.m
//  layer_test
//
//

#import "UIViewAnimationVC.h"

@interface UIViewAnimationVC ()

@end

@implementation UIViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UIViewAnimationVC";

    UIImage *image = [UIImage imageNamed:@"treehole"];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = image;
    imageView.frame = CGRectMake(120, 140, 80, 80);
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:1 delay:2 options:(UIViewAnimationOptionBeginFromCurrentState) animations:^{
        imageView.frame = CGRectMake(80, 100, 160, 160);
    } completion:^(BOOL finished) {
        
    }];
    
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
