//
//  EYHealthKitViewController.m
//  EYHealthDemo
//
//  Created by 尹华东 on 2019/5/9.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "EYHealthKitViewController.h"
#import <HealthKit/HealthKit.h>

@interface EYHealthKitViewController ()
{
    __weak IBOutlet UITextField *startDateField;
    __weak IBOutlet UITextField *endDateField;
    
    __weak IBOutlet UITextField *stepField;
    __weak IBOutlet UITextField *distanceField;
    
    __weak IBOutlet UILabel *startLabel;
    __weak IBOutlet UILabel *endLabel;
    __weak IBOutlet UILabel *stepLabel;
    __weak IBOutlet UILabel *distanceLabel;
    
    
}

@property (nonatomic,strong) HKHealthStore *healthStore;
@property (nonatomic,strong) NSDate *startDate;
@property (nonatomic,strong) NSDate *endDate;
@property (nonatomic,strong) HKSampleQuery *sampleStepQuery;
@property (nonatomic,strong) HKSampleQuery *sampleDistanceQuery;

@property (nonatomic,strong) UIDatePicker *healthStartDatePicker;
@property (nonatomic,strong) UIDatePicker *healthEndDatePicker;

@end

@implementation EYHealthKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HealthKitDemo";
    
    [self HealthKitDemo];
    
    [self setUpView];
}

- (void)setUpView{
    
    self.healthStartDatePicker = [[UIDatePicker alloc] init];
    //设置地区: zh-中国
    self.healthStartDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //设置日期模式(Displays month, day, and year depending on the locale setting)
    self.healthStartDatePicker.datePickerMode = UIDatePickerModeDate;
    // 设置当前显示时间
    [self.healthStartDatePicker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
    [self.healthStartDatePicker setMaximumDate:[NSDate date]];
    //监听DataPicker的滚动
    [self.healthStartDatePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    self.healthEndDatePicker = [[UIDatePicker alloc] init];
    //设置地区: zh-中国
    self.healthEndDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //设置日期模式(Displays month, day, and year depending on the locale setting)
    self.healthEndDatePicker.datePickerMode = UIDatePickerModeDate;
    // 设置当前显示时间
    [self.healthEndDatePicker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
    [self.healthEndDatePicker setMaximumDate:[NSDate date]];
    //监听DataPicker的滚动
    [self.healthEndDatePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    //设置时间输入框的键盘框样式为时间选择器
    startDateField.inputView = self.healthStartDatePicker;
    endDateField.inputView = self.healthEndDatePicker;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endTextField)];
    [self.view addGestureRecognizer:tap];
}

- (void)endTextField{
    [self.view endEditing:YES];
}

#pragma mark - HealthKit
- (void)HealthKitDemo{
    //检测设备是否支持HealthKit
    if (![HKHealthStore isHealthDataAvailable]) {
        NSLog(@"该设备不支持HealthKit");
        return;
    }
    
    self.healthStore = [[HKHealthStore alloc]init];
    
//    [self getHealthData];
}

//向用户请求授权共享或读取健康数据
- (void)getHealthData{
    
    
    NSMutableArray *readArray = [NSMutableArray array];
    
    HKQuantityType *stepType = [HKQuantityType quantityTypeForIdentifier:(HKQuantityTypeIdentifierStepCount)];
    [readArray addObject:stepType];
    HKQuantityType *distanceType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    [readArray addObject:distanceType];
    
    NSSet<HKSampleType *> *shareTypes = [NSSet setWithArray:readArray];
    NSSet<HKObjectType *> *readTypes = [NSSet setWithArray:readArray];
    
    [self.healthStore requestAuthorizationToShareTypes:shareTypes readTypes:readTypes completion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            //获取步数后我们调用获取步数的方法
            [self readStepCount];
            [self readDistance];
        }
        else
        {
            NSLog(@"获取步数权限失败");
        }
    }];
    
}

- (void)readStepCount{
    
    HKSampleType *sampleType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    NSSortDescriptor *start = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    
//    NSDate *startDate = [NSDate dateWithTimeIntervalSinceNow:-3600*3600];
//    NSDate *endDate = [NSDate date];

    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:self.startDate endDate:self.endDate options:(HKQueryOptionNone)];
    
    self.sampleStepQuery = [[HKSampleQuery alloc]initWithSampleType:sampleType predicate:predicate limit:0 sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        //设置一个int型变量来作为步数统计
        int allStepCount = 0;
        for (int i = 0; i < results.count; i ++) {
            //把结果转换为字符串类型
            HKQuantitySample *result = results[i];
            HKQuantity *quantity = result.quantity;
            NSMutableString *stepCount = (NSMutableString *)quantity;
            NSString *stepStr =[ NSString stringWithFormat:@"%@",stepCount];
            //获取51 count此类字符串前面的数字
            NSString *str = [stepStr componentsSeparatedByString:@" "][0];
            int stepNum = [str intValue];
            NSLog(@"%d",stepNum);
            //把一天中所有时间段中的步数加到一起
            allStepCount = allStepCount + stepNum;
        }
        NSLog(@"查询步数＝＝＝＝%d",allStepCount);
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            self->stepLabel.text = [NSString stringWithFormat:@"步数：%d",allStepCount];
        });
        
    }];
    
    [self.healthStore executeQuery:self.sampleStepQuery];
    
}

- (void)readDistance{
    
    HKSampleType *sampleType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    
    NSSortDescriptor *start = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    
//    NSDate *startDate = [NSDate dateWithTimeIntervalSinceNow:-3600*3600];
//    NSDate *endDate = [NSDate date];
    
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:self.startDate endDate:self.endDate options:(HKQueryOptionNone)];
    
    self.sampleDistanceQuery = [[HKSampleQuery alloc]initWithSampleType:sampleType predicate:predicate limit:0 sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        //设置一个int型变量来作为步数统计
        double allDistance = 0;
        for (int i = 0; i < results.count; i ++) {
            //把结果转换为字符串类型
            HKQuantitySample *result = results[i];
            HKQuantity *quantity = result.quantity;
            NSMutableString *stepCount = (NSMutableString *)quantity;
            NSString *stepStr =[ NSString stringWithFormat:@"%@",stepCount];
            //获取51 count此类字符串前面的数字
            NSString *str = [stepStr componentsSeparatedByString:@" "][0];
            double distance = [str doubleValue];
            NSLog(@"%f",distance);
            //把一天中所有时间段中的距离加到一起
            allDistance = allDistance + distance;
        }
        NSLog(@"查询距离＝＝＝＝%f",allDistance);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            self->distanceLabel.text = [NSString stringWithFormat:@"距离：%f",allDistance];
        });
    }];
    
    [self.healthStore executeQuery:self.sampleDistanceQuery];
    
}

- (void)stopExecute{
    if (!self.sampleStepQuery || !self.sampleDistanceQuery) {
        [self showAlert:@"先开始监听"];
        return;
    }
    
    [self.healthStore stopQuery:self.sampleStepQuery];
    [self.healthStore stopQuery:self.sampleDistanceQuery];
}

- (void)writeToHealthKitWithStep:(double)step Distance:(double)distance{
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    HKQuantityType *stepType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    HKQuantity *stepQuantity = [HKQuantity quantityWithUnit:[HKUnit countUnit] doubleValue:step];
    HKQuantitySample *stepSample = [HKQuantitySample quantitySampleWithType:stepType quantity:stepQuantity startDate:[NSDate date] endDate:[NSDate date]];
    [tempArray addObject:stepSample];
    
    HKQuantityType *distanceType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    HKQuantity *distanceQuantity = [HKQuantity quantityWithUnit:[HKUnit countUnit] doubleValue:distance];
    HKQuantitySample *distanceSample = [HKQuantitySample quantitySampleWithType:distanceType quantity:distanceQuantity startDate:[NSDate date] endDate:[NSDate date]];
    [tempArray addObject:distanceSample];
    
    NSArray<HKObject *> *saveObject = [NSArray arrayWithArray:tempArray];
    [self.healthStore saveObjects:saveObject withCompletion:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            NSString *showString = success ? @"成功" : @"失败";
            [self showAlert:showString];
        });
    }];

}

- (void)showAlert:(NSString *)string{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

#pragma mark - action
- (IBAction)startMonitor:(id)sender {
    if (!self.startDate || !self.endDate) {
        NSLog(@"请设置开始时间或结束时间");
        [self showAlert:@"请设置开始时间或结束时间"];
        return;
    }
    
    startLabel.text = [NSString stringWithFormat:@"开始时间：%@",startDateField.text];
    endLabel.text = [NSString stringWithFormat:@"结束时间：%@",endDateField.text];
    
    [self getHealthData];
}

- (IBAction)stopMonitor:(id)sender {
    [self stopExecute];
}

- (IBAction)saveData:(id)sender {
    
    [self writeToHealthKitWithStep:stepField.text.doubleValue Distance:distanceField.text.doubleValue];
}

//禁止用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField isEqual:startDateField] || [textField isEqual:endDateField]) {
        return NO;
    }
    return YES;
}

- (void)dateChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy年 MM月 dd日 HH:mm";
    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
    
    if ([datePicker isEqual:self.healthStartDatePicker]) {
        startDateField.text = dateStr;
        self.startDate = datePicker.date;
    }
    else if ([datePicker isEqual:self.healthEndDatePicker]){
        endDateField.text = dateStr;
        self.endDate = datePicker.date;
    }
    
}

@end
