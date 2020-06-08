//
//  AdapterViewController.m
//  DesignPatternDemo
//
//    
//  
//

#import "AdapterViewController.h"
#import "AdapterCNY.h"
#import "AdapterManager.h"
#import "AdapterUSD.h"

#import "AdapterAudioPlayer.h"


@interface AdapterViewController ()

@end

@implementation AdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn1 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn1 setTitle:@"demo1" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn1 setTag:1];
    [self.view addSubview:btn1];
    [btn1 setCenter:CGPointMake(self.view.frame.size.width/2, 200)];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn2 setFrame:CGRectMake(0, 0, 120, 40)];
    [btn2 setTitle:@"demo2" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(doTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn2 setTag:2];
    [self.view addSubview:btn2];
    [btn2 setCenter:CGPointMake(self.view.frame.size.width/2, 300)];
    
}

- (void)doTap:(UIButton *)sender{
    switch (sender.tag) {
        case 1:
        {
            //demo1
            /*
             把100美元转换成人民币.
             
             类适配器：通过继承来适配两个接口
             对象适配器：不继承被适配者，他们是一个关联关系，相当于引用了这个类
             */
            
            //类适配器
            AdapterCNY *adapterCNY = [[AdapterCNY alloc] init];
            float cny = [adapterCNY getCNY];
            NSLog(@"cny is %f",cny);
            
            
            //对象适配器
            AdapterManager *manager = [[AdapterManager alloc] initWithAdapter:[AdapterUSD new]];
            float cny2 = [manager getCNY];
            NSLog(@"cny2 is %f",cny2);
        }
            break;
            
        case 2:
        {
            //demo2
            AdapterAudioPlayer *audioPlayer = [AdapterAudioPlayer new];
            [audioPlayer play:@"beyond the horizon.mp3" audioType:@"mp3"];
            [audioPlayer play:@"alone.mp4" audioType:@"mp4"];
            [audioPlayer play:@"far far away.vlc" audioType:@"vlc"];
            [audioPlayer play:@"mind me.avi" audioType:@"avi"];

        }
            break;
            
        default:
            break;
    }
}


@end
