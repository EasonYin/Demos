//
//  EYPedometerViewController.m
//  EYHealthDemo
//
//  Created by 尹华东 on 2019/5/8.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "EYPedometerViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface EYPedometerViewController ()
{
    //showView
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *startDate;
    __weak IBOutlet UILabel *endDate;
    __weak IBOutlet UILabel *step;
    __weak IBOutlet UILabel *distance;
    __weak IBOutlet UILabel *floorUp;
    __weak IBOutlet UILabel *floorDown;
    __weak IBOutlet UILabel *currentSpeed;
    __weak IBOutlet UILabel *currentCadence;
    __weak IBOutlet UILabel *averageSpeed;
    
    //配置
    __weak IBOutlet UITextField *monitorStartDate;
    __weak IBOutlet UITextField *monitorEndDate;
    
}

@property (nonatomic,strong) CMPedometer *pedometer;
@property (nonatomic,strong) UIDatePicker *pedometerStartDatePicker;
@property (nonatomic,strong) UIDatePicker *pedometerEndDatePicker;
@property (nonatomic,strong) NSDate *pedometerStartDate;
@property (nonatomic,strong) NSDate *pedometerEndDate;

@end

@implementation EYPedometerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"CoreMotionDemo";
    
    [self CoreMotionDemo];
    
    [self setUpPicker];
    
}

- (void)setUpPicker{
    
    self.pedometerStartDatePicker = [[UIDatePicker alloc] init];
    //设置地区: zh-中国
    self.pedometerStartDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //设置日期模式(Displays month, day, and year depending on the locale setting)
    self.pedometerStartDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    // 设置当前显示时间
    [self.pedometerStartDatePicker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
    [self.pedometerStartDatePicker setMaximumDate:[NSDate date]];
    //监听DataPicker的滚动
    [self.pedometerStartDatePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    self.pedometerEndDatePicker = [[UIDatePicker alloc] init];
    //设置地区: zh-中国
    self.pedometerEndDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //设置日期模式(Displays month, day, and year depending on the locale setting)
    self.pedometerEndDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    // 设置当前显示时间
    [self.pedometerEndDatePicker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
    [self.pedometerEndDatePicker setMaximumDate:[NSDate date]];
    //监听DataPicker的滚动
    [self.pedometerEndDatePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];

    //设置时间输入框的键盘框样式为时间选择器
    monitorStartDate.inputView = self.pedometerStartDatePicker;
    monitorEndDate.inputView = self.pedometerEndDatePicker;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endTextField)];
    [self.view addGestureRecognizer:tap];
}

- (void)endTextField{
    [self.view endEditing:YES];
}

#pragma mark - CoreMotion
- (void)CoreMotionDemo{
    
    //初始化
    if (![CMPedometer isStepCountingAvailable]) {
        NSLog(@"该设备不支持CMPedometer");
        return;
    }
    self.pedometer = [[CMPedometer alloc]init];
    
}

//更新界面
- (void)updateShowView:(CMPedometerData *)pedometerData{
    /*
     //计步器数据的开始时间。
     @property(readonly, nonatomic) NSDate *startDate;
     //计步器数据的结束时间。
     @property(readonly, nonatomic) NSDate *endDate;
     //用户采取的步骤数。
     @property(readonly, nonatomic) NSNumber *numberOfSteps;
     //用户行进的估计距离（以米为单位）。
     @property(readonly, nonatomic, nullable) NSNumber *distance;
     //通过步行提升的大致楼层数。
     @property(readonly, nonatomic, nullable) NSNumber *floorsAscended;
     //通过步行下降的大致楼层数。
     @property(readonly, nonatomic, nullable) NSNumber *floorsDescended;
     //用户当前的速度，以每米的秒数来衡量。
     @property(readonly, nonatomic, nullable) NSNumber *currentPace NS_AVAILABLE(NA,9_0);
     //采取步骤的速度，以每秒步数为单位。
     @property(readonly, nonatomic, nullable) NSNumber *currentCadence NS_AVAILABLE(NA,9_0);
     //用户的平均速度，以每米的秒数来衡量。
     @property(readonly, nonatomic, nullable) NSNumber *averageActivePace NS_AVAILABLE(NA,10_0);
     */
    NSLog(@"开始时间：%@",pedometerData.startDate.description);
    NSLog(@"结束时间：%@",pedometerData.endDate.description);
    NSLog(@"步数：%zd",pedometerData.numberOfSteps.integerValue);
    NSLog(@"距离：%zd",pedometerData.distance.integerValue);
    NSLog(@"楼层上行：%zd",pedometerData.floorsAscended.integerValue);
    NSLog(@"楼层下行：%zd",pedometerData.floorsDescended.integerValue);
    NSLog(@"当前速度：%zd",pedometerData.currentPace.integerValue);
    NSLog(@"当前节奏：%zd",pedometerData.currentCadence.integerValue);
    NSLog(@"平均速度：%zd",pedometerData.averageActivePace.integerValue);
    
    
    startDate.text = [NSString stringWithFormat:@"开始时间：%@",pedometerData.startDate.description];
    endDate.text = [NSString stringWithFormat:@"结束时间：%@",pedometerData.endDate.description];
    step.text = [NSString stringWithFormat:@"步数：%zd",pedometerData.numberOfSteps.integerValue];
    distance.text = [NSString stringWithFormat:@"距离：%zd",pedometerData.distance.integerValue];
    floorUp.text = [NSString stringWithFormat:@"楼层上行：%zd",pedometerData.floorsAscended.integerValue];
    floorDown.text = [NSString stringWithFormat:@"楼层下行：%zd",pedometerData.floorsDescended.integerValue];
    currentSpeed.text = [NSString stringWithFormat:@"当前速度：%zd",pedometerData.currentPace.integerValue];
    currentCadence.text = [NSString stringWithFormat:@"当前节奏：%zd",pedometerData.currentCadence.integerValue];
    averageSpeed.text = [NSString stringWithFormat:@"平均速度：%zd",pedometerData.averageActivePace.integerValue];

}

//开始监测
- (void)startPedometerUpdatesFromDate:(NSDate *)startDate{
    
    [self.pedometer startPedometerUpdatesFromDate:startDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        
        //更新界面元素
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateShowView:pedometerData];
        });
    }];
}

//获取某个时间段内的数据，不是实时更新
- (void)getPedometerDataFromDate:(NSDate *)startDate toDate:(NSDate *)endDate{
    
    [self.pedometer queryPedometerDataFromDate:startDate toDate:endDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        
        //更新界面元素
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateShowView:pedometerData];
        });
        
    }];
    
}

#pragma mark - Action

- (IBAction)startMonitor:(id)sender {
    if (!self.pedometerStartDate) {
        NSLog(@"请设置开始时间");
        return;
    }
    titleLabel.text = @"运动数据：监听中";
    [self startPedometerUpdatesFromDate:self.pedometerStartDate];
}

- (IBAction)stopMonitor:(id)sender {
    titleLabel.text = @"运动数据：结束监听";
    [self.pedometer stopPedometerUpdates];
}

- (IBAction)getData:(id)sender {
    if (self.pedometerStartDate.description.length <= 0 || self.pedometerEndDate.description.length <= 0) {
        NSLog(@"请设置开始时间或结束时间");
        return;
    }
    titleLabel.text = @"运动数据：";
    [self getPedometerDataFromDate:self.pedometerStartDate toDate:self.pedometerEndDate];
}

//禁止用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (void)dateChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy年 MM月 dd日 HH:mm";
    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
    
    if ([datePicker isEqual:self.pedometerStartDatePicker]) {
        monitorStartDate.text = dateStr;
        self.pedometerStartDate = datePicker.date;
    }
    else if ([datePicker isEqual:self.pedometerEndDatePicker]){
        monitorEndDate.text = dateStr;
        self.pedometerEndDate = datePicker.date;
    }
    
}

@end
