//
//  IteratorPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "IteratorPatternViewController.h"
#import "IteratorNameRepository.h"

@interface IteratorPatternViewController ()

@end

@implementation IteratorPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    IteratorNameRepository *namesRepository = [[IteratorNameRepository alloc]init];
    
    for (IteratorIterator *iter = [namesRepository getIterator]; [iter hasNext]; ) {
        NSString *name = [iter next];
        NSLog(@"Name : %@",name);
    }
    
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
