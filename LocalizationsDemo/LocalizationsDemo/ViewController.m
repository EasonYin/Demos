//
//  ViewController.m
//  LocalizationsDemo
//
//

#import "ViewController.h"
#import "YHDLocalized.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    NSString *title = NSLocalizedString(@"title", nil);
    self.title = title;
    
    [self setNavLeftBtn];
    [self setNavRightBtn];
    
    NSString *imageName = NSLocalizedString(@"image", nil);
    UIImage *image = [UIImage imageNamed:imageName];
    self.imageView.image = image;
}

- (void)setNavLeftBtn{
    NSString *leftBtnTitle = NSLocalizedString(@"click", nil);
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithTitle:leftBtnTitle style:(UIBarButtonItemStylePlain) target:self action:@selector(doNavLeftBtnAction:)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
}

- (void)doNavLeftBtnAction:(id)sender{
    
}

- (void)setNavRightBtn{
    NSString *rightBtnTitle = NSLocalizedStringFromTable(@"click", @"MyString", nil);
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc]initWithTitle:rightBtnTitle style:(UIBarButtonItemStylePlain) target:self action:@selector(doNavRightBtnAction:)];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
}

- (void)doNavRightBtnAction:(id)sender{
    
}

- (IBAction)doChangeAction:(id)sender {
    
    // 切换语言前
    NSString *language1 = [[NSUserDefaults standardUserDefaults] valueForKey:AppLanguage];
    NSLog(@"模拟器语言切换之前：%@",language1);
    
    // 切换语言
    NSString *language = @"en";
    if ([language1 hasPrefix:@"en"]) {
        language = @"zh-Hans";
    }
    
    [[YHDLocalized sharedInstance] setLanguage:language];
    [self initRootVC];
    
    // 切换语言后
    NSString *language2 = [[NSUserDefaults standardUserDefaults] valueForKey:AppLanguage];
    NSLog(@"模拟器语言切换之后：%@",language2);
    
}

- (void)initRootVC{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    if (@available(iOS 13.0, *)) {
        [UIApplication sharedApplication].windows[0].rootViewController = vc;
    } else {
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    };
}

@end
