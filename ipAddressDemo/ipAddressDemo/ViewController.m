//
//  ViewController.m
//  ipAddressDemo
//
//  Created by 尹华东 on 2020/1/20.
//  Copyright © 2020 EasonY. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableDictionary *resDic;

@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];

    [self setRightBtn];
}

- (void)setRightBtn{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"获取位置" style:(UIBarButtonItemStylePlain) target:self action:@selector(getWANIP)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)getWANIP{
    
    //通过淘宝提供的服务，定位WAN的IP
    NSURL *ipURL = [NSURL URLWithString:@"http://ip.taobao.com/service/getIpInfo.php?ip=myip"];
    NSData *data = [NSData dataWithContentsOfURL:ipURL];
    if (data) {
        NSDictionary *ipDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"IPDict:%@",ipDict);
        //获取成功
        if (ipDict && [ipDict[@"code"] integerValue] == 0) {
            NSDictionary *data = ipDict[@"data"];
            self.resDic = data.mutableCopy;
            [self.tableView reloadData];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resDic.allKeys.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.resDic.allKeys[indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.resDic.allValues[indexPath.row]];
    
    return cell;
    
}

@end
