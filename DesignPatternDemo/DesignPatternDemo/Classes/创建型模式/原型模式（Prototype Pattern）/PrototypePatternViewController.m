//
//  PrototypePatternViewController.m
//  DesignPatternDemo
//
//      
//  
//

#import "PrototypePatternViewController.h"
#import "PrototypeClassModel.h"
#import "PrototypeStudentModel.h"
#import "PrototypePattern.h"

@interface PrototypePatternViewController ()

@end

@implementation PrototypePatternViewController

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
            ConcreteProduct *prototype = [[ConcreteProduct alloc]init];
            
            Client *client = [[Client alloc]init];
            client.prototype = prototype;
            
            id<IProduct> product = [client operation];
            NSLog(@"%@",product.name);
        }
            break;
            
        case 2:
        {
            //demo2
            PrototypeStudentModel *stu1 = [PrototypeStudentModel new];
            stu1.name = @"张三";
            stu1.age = 12;
            
            PrototypeStudentModel *stu2 = stu1.copy;
            
            // classModel
            PrototypeClassModel *class1 = [[PrototypeClassModel alloc] init];
            class1.className = @"class1";
            class1.students = @[stu1, stu2];
            
            PrototypeClassModel *class2 = class1.copy;
            NSLog(@"%@ ----%@", class1, class2);
            
            NSLog(@"%@", class1.students);
            NSLog(@"%@", class2.students);
        }
            break;
            
        default:
            break;
    }
}

@end
