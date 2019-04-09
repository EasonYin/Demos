//
//  ViewController.m
//  layer_test
//
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"LayerTest";
    
    self.dataArray = @[
                       @[
                           @"TouchMainViewController",
                           @"DrawLayerViewController",
                           @"LayerViewController",
                           
                           ],
                       @[
                           @"UIViewAnimationVC",
                           @"MoveAnimationVC",
                           @"MoveKeyAnimationVC",
                           @"GroupAnimationVC",
                           @"TrasitionImageVC",
                           @"CADisplayLinkVC",

                           ],
                       @[
                           @"UIViewAnimationBaseVC",
                           @"UIViewAnimationKeyVC",
                           @"UIViewAnimationTrasitionVC",
                           
                           ]
                       ];
    
    [self.tableView reloadData];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray*)self.dataArray[section]).count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class class = NSClassFromString(self.dataArray[indexPath.section][indexPath.row]);
    [self.navigationController pushViewController:[class new] animated:YES];
    
}

@end
