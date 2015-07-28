//
//  BSWeekTableViewController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/19.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSWeekTableViewController.h"
#import "BSWeekDiaryCell.h"
#import "BSDiaryInfo.h"
#import "TLAlertView.h"
#import "TLDemoViewController.h"
@interface BSWeekTableViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
// 定义变量记录当前按钮的状态
@property (nonatomic, assign, getter = isOpen) BOOL open;
@property(strong,nonatomic) NSArray *diarys;
- (IBAction)chooseLeader:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *leaderBtn;

@property (strong, nonatomic) UIView* leaderChooseView;
@property (strong,nonatomic)UIPickerView* leaderChoosePiceker;
@end

@implementation BSWeekTableViewController{
    NSArray* leaders;
}

-(NSArray*)diarys{
    if(!_diarys){
        _diarys = [NSArray array];
    }
    return _diarys;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLeaderChooseView];
    _diarys = @[@{@"weeked":@"星期一",@"name":@"吴炳泉",@"time":@"09:30 - 12:00",@"meetingRoom":@"秦二厂BX楼517会议室",@"content":@"2015年第24次总经理例会、第21次总经理办公会"},@{@"weeked":@"星期二",@"name":@"吴炳泉",@"time":@"09:30 - 11:00",@"meetingRoom":@"秦二厂BX楼517会议室",@"content":@"生产决策领导小组会"},@{@"weeked":@"星期三",@"name":@"吴炳泉",@"time":@"09:00 - 11:00",@"meetingRoom":@"秦二厂BY楼201会议室",@"content":@"中央第一巡视组专项巡视中核集团公司情况反馈会（视频会）"},@{@"weeked":@"星期三",@"name":@"吴炳泉",@"time":@"13:00 - 16:00",@"meetingRoom":@"秦二厂BD楼三楼报告厅",@"content":@"2015第二次技术委员会会议"},@{@"weeked":@"星期四",@"name":@"吴炳泉",@"time":@"09:00 - 09:30",@"meetingRoom":@"秦二厂BY楼310会议室",@"content":@"公司一届六次职工代表大会主席团会议"},@{@"weeked":@"星期四",@"name":@"吴炳泉",@"time":@"09:30 - 11:45",@"meetingRoom":@"秦二厂BY楼301报告厅",@"content":@"公司一届六次职工代表大会"},@{@"weeked":@"星期五",@"name":@"吴炳泉",@"time":@"13:30 - 15:30",@"meetingRoom":@"秦二厂BX楼517会议室",@"content":@"党委中心组学习会（“三严三实”专题研讨）"}];
    
   
}
- (void)showLeaderChooseView{
    _leaderChooseView = [[UIView alloc] init];
    _leaderChooseView.frame = CGRectMake(0, -264, 320, 200);
    _leaderChooseView.backgroundColor = [UIColor whiteColor];
    _leaderChoosePiceker = [[UIPickerView alloc] init];
    _leaderChoosePiceker.delegate = self;
    _leaderChoosePiceker.dataSource = self;
    _leaderChoosePiceker.frame = CGRectMake(20, 10, 280, 180);
    [_leaderChooseView addSubview:_leaderChoosePiceker];
    leaders = @[@"张涛",@"吴岗",@"徐利根",@"王奇文",@"张建成",@"刘志勇",@"邹正宇",@"刘电文",@"吴炳泉",@"孙占辉",@"洪源平",@"仲卫东",@"郭志敏",@"周方国",@"黄志军",@"孔玉春",@"孔德萍",@"刘崇都",@"张兴田",@"张伟",@"张丽萍",@"洪潭",@"郑永祥",@"徐侃",@"姚翀",@"伍吉泽",@"石建新",@"朱晓斌",@"候英东"];
    
    [self.view.superview.window addSubview:_leaderChooseView];
    //[self.view.superview bringSubviewToFront:_leaderChooseView];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    [pickerView reloadAllComponents];
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    [_leaderBtn setTitle:leaders[row] forState:UIControlStateNormal];
    return leaders[row];
}
//有多少个compoent
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//对应的compoent分别有几行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return leaders.count;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _diarys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    BSWeekDiaryCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Diarycell"];
    //如果缓存池中没有（第一次进入）也不用代码创建出这几个Cell那么直接去storyboard找cell（可以参考view的创建过程）
    if(cell == nil){
        cell = [BSWeekDiaryCell bSWeekDiaryCell];
    }
    BSDiaryInfo* bsdiartInfo = [BSDiaryInfo bSDiaryInfoWithDict:_diarys[indexPath.row]];
    cell.bSDiaryInfo = bsdiartInfo;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TLDemoViewController *demoVC = [[TLDemoViewController alloc] initWithNibName:@"TLDemoViewController" bundle:[NSBundle mainBundle]];
    TLAlertView *alertView = [[TLAlertView alloc] initWithView:demoVC.view outsideClose:YES];
    [alertView show];
}

- (IBAction)chooseLeader:(id)sender {
   
    if (!self.isOpen) {// 没有打开
        
        // 改变当前按钮的状态
        self.open = YES;
        
        // 显示内容view
        //        self.contentView.hidden = NO;
        [UIView animateWithDuration:1.0 animations:^{
            // 1.旋转按钮上的尖尖
            self.leaderChooseView.frame = CGRectMake(0, 0, 320, 200);
        }];
        
    }else // 已经打开
    {
        NSLog(@"关闭");
        // 改变当前按钮的状态
        self.open = NO;
        
        //        // 隐藏内容View
        //        self.contentView.hidden = YES;
        [UIView animateWithDuration:0.8 animations:^{
            // 1.旋转按钮上的尖尖
            self.leaderChooseView.frame = CGRectMake(0, -264, 320, 200);
        }];
        
        [self.tableView reloadData];
    }
    
    NSLog(@"%f",self.leaderChooseView.frame.origin.y);
}

@end
