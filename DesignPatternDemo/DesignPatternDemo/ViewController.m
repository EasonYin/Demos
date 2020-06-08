//
//  ViewController.m
//  DesignPatternDemo
//
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableDictionary *dic;//创建一个字典进行判断收缩还是展开
}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray<NSDictionary *> *designArray;
@property (nonatomic,strong) NSDictionary *designDic;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设计模式Demo";
    
    dic = [NSMutableDictionary dictionary];
    
    [self.view addSubview:self.tableView];
    
    
    
}

#pragma mark - getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)designArray{
    if (!_designArray) {
        _designArray = @[
            @{
                @"title":@"设计原则",
                @"array":@[@"单一职责原则",
                           @"开闭原则",
                           @"里氏替换原则"
                           ,@"接口隔离原则",
                           @"依赖倒置原则",
                           @"迪米特法则",
                           @"组合/聚合复用原则"
                ]
            },
            @{
                @"title":@"创建型模式",
                @"array":@[@"工厂方法模式",
                           @"抽象工厂模式",
                           @"单例模式",
                           @"构建者模式",
                           @"原型模式"
                ]
            },
            @{
                @"title":@"结构型模式",
                @"array":@[@"适配器模式",
                           @"桥接模式",
                           @"过滤器模式",
                           @"组合模式",
                           @"装饰器模式",
                           @"外观模式",
                           @"享元模式",
                           @"代理模式"]
            },
            @{
                @"title":@"行为型模式",
                @"array":@[@"责任链模式",
                           @"命令模式",
                           @"解释器模式",
                           @"迭代器模式",
                           @"中介者模式",
                           @"备忘录模式",
                           @"观察者模式",
                           @"状态模式",
                           @"空对象模式",
                           @"策略模式",
                           @"模板模式",
                           @"访问者模式"
                ]
            },
            
        ];
    }
    return _designArray;
}

- (NSDictionary *)designDic{
    if (!_designDic) {
        
        _designDic = @{
            //设计模式的六大原则
            @"单一职责原则":@"Object_SViewController",
            @"开闭原则":@"Object_OViewController",
            @"里氏替换原则":@"Object_LViewController",
            @"接口隔离原则":@"Object_IViewController",
            @"依赖倒置原则":@"Object_DViewController",
            @"迪米特法则":@"Object_LODViewController",
            @"组合/聚合复用原则":@"Object_CViewController",
            
            /*
             创建型模式:
             这些设计模式提供了一种在创建对象的同时隐藏创建逻辑的方式，而不是使用 new 运算符直接实例化对象。这使得程序在判断针对某个给定实例需要创建哪些对象时更加灵活。
             */
            @"工厂方法模式":@"FactoryPatternViewController",
            @"抽象工厂模式":@"AbstractFactoryPatternViewController",
            @"单例模式":@"SingletonPatternViewController",
            @"构建者模式":@"BuilderPatternViewController",
            @"原型模式":@"PrototypePatternViewController",
            
            /*
             结构型模式:
             这些设计模式关注类和对象的组合。继承的概念被用来组合接口和定义组合对象获得新功能的方式。
             */
            @"适配器模式":@"AdapterViewController",
            @"过滤器模式":@"FilterPatternViewController",
            @"装饰器模式":@"DecoratorPatternViewController",
            @"代理模式":@"ProxyPatternViewController",
            @"外观模式":@"FacadePatternViewController",
            @"桥接模式":@"BridgePatternViewController",
            @"组合模式":@"CompositePatternViewController",
            @"享元模式":@"FlyweightPatternViewController",
            
            /*
             行为型模式
             这些设计模式特别关注对象之间的通信。
             */
            @"策略模式":@"StrategyPatternViewController",
            @"模板模式":@"TemplatePatternViewController",
            @"观察者模式":@"ObserverPatternViewController",
            @"中介者模式":@"MediatorPatternViewController",
            @"迭代器模式":@"IteratorPatternViewController",
            @"责任链模式":@"ChainOfResponsibilityPatternViewController",
            @"命令模式":@"CommandPatternViewController",
            @"备忘录模式":@"MementoPatternViewController",
            @"状态模式":@"StatePatternViewController",
            @"访问者模式":@"VisitorPatternViewController",
            @"解释器模式":@"InterpreterPatternViewController",
            @"空对象模式":@"NullObjectPatternViewController",
            
        };
    }
    return _designDic;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
//section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.designArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    view.backgroundColor = [UIColor lightGrayColor];
    UIButton *titleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [titleBtn setFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    [titleBtn setTitle:self.designArray[section][@"title"] forState:(UIControlStateNormal)];
    [titleBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [titleBtn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentLeft)];
    [titleBtn setTitleEdgeInsets:(UIEdgeInsetsMake(0, 10, 0, 0))];
    [titleBtn addTarget:self action:@selector(action_tap:) forControlEvents:(UIControlEventTouchUpInside)];
    [titleBtn setTag:300 + section];
    [view addSubview:titleBtn];
    return view;
}

- (void)action_tap:(UIButton *)sender{
    NSString *str = [NSString stringWithFormat:@"%ld",sender.tag - 300];
    if ([dic[str] integerValue] == 0) {//如果是0，就把1赋给字典,打开cell
        [dic setObject:@"1" forKey:str];
    }else{//反之关闭cell
        [dic setObject:@"0" forKey:str];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:[str integerValue]]withRowAnimation:UITableViewRowAnimationFade];//有动画的刷新
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

//cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *string = [NSString stringWithFormat:@"%ld",section];
    if ([dic[string] integerValue] == 1 ) {  //打开cell返回数组的count
        return ((NSArray *)self.designArray[section][@"array"]).count;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *cellArray = self.designArray[indexPath.section][@"array"];
    cell.textLabel.text = [cellArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *cellArray = self.designArray[indexPath.section][@"array"];
    NSString *type = [cellArray objectAtIndex:indexPath.row];
    NSLog(@"\n\n=================设计模式：%@=================\n\n",type);
    NSString *vcName = [self.designDic objectForKey:type];
    UIViewController *subViewController = [[NSClassFromString(vcName) alloc] init];
    subViewController.title = type;
    subViewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:subViewController animated:YES];
}

@end
