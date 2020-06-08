//
//  ObserverPatternViewController.m
//  DesignPatternDemo
//
//   
//  
//

#import "ObserverPatternViewController.h"
#import "ObserverNotification.h"
#import "ObserverKVO.h"

@interface ObserverPatternViewController ()
@property (nonatomic,strong) ObserverKVO *obKvo;
@end

@implementation ObserverPatternViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"ObserverNotification" object:nil];
    
    _obKvo = [[ObserverKVO alloc]init];
    [_obKvo addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];

    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn1.frame = CGRectMake(100, 200, 120, 40);
    [btn1 setTitle:@"noti" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(doActioin1:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn2.frame = CGRectMake(100, 300, 120, 40);
    [btn2 setTitle:@"kvo" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(doActioin2:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn2];
    
}

- (void)doActioin1:(id)sender
{
    ObserverNotification *noti = [ObserverNotification new];
    [noti post];
}

- (void)doActioin2:(id)sender
{
    self.obKvo.name = [NSString stringWithFormat:@"%d",arc4random()%10];
}

- (void)noti:(NSNotification *)noti
{
    NSLog(@"noti:%@",noti.object);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"===kvo===");
    NSLog(@"keyPath:%@",keyPath);
    NSLog(@"object:%@",object);
    NSLog(@"change:%@",change);
    NSLog(@"context:%@",context);
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
