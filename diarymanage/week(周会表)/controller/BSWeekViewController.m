//
//  BSWeekViewController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/16.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSWeekViewController.h"
#import "BSMeetingTableViewController.h"
#import "SXTitleLable.h"

@interface BSWeekViewController()
@property (weak, nonatomic) IBOutlet UIScrollView *smallScrollView;
@property (weak, nonatomic) IBOutlet UIView *AdministrationConference;
@property (weak, nonatomic) IBOutlet UIView *specialWork;
@property (weak, nonatomic) IBOutlet UIView *partyMeeting;
@property (weak, nonatomic) IBOutlet UIView *productMeeting;
@property (strong,nonatomic) NSString* tittleName;
@property (strong,nonatomic) NSString* btnTag;
@end

@implementation BSWeekViewController
-(void)viewDidLoad{
    
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.showsVerticalScrollIndicator = NO;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(meetingDetail:)];
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(meetingDetail2:)];
    UITapGestureRecognizer *tapRecognizer3 = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(meetingDetail3:)];
    UITapGestureRecognizer *tapRecognizer4 = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(meetingDetail4:)];
    //tapRecognizer.cancelsTouchesInView = NO;
    [_AdministrationConference addGestureRecognizer:tapRecognizer];
    [_specialWork addGestureRecognizer:tapRecognizer2];
    [_partyMeeting addGestureRecognizer:tapRecognizer3];
    [_productMeeting addGestureRecognizer:tapRecognizer4];
    
    [self addLable];
}

/** 添加标题栏 */
- (void)addLable
{
    for (int i = 1; i < 8; i++) {
        CGFloat lblW = 70;
        CGFloat lblH = 30;
        CGFloat lblY = 0;
        CGFloat lblX = (i-1) * lblW;
        SXTitleLable *lbl1 = [[SXTitleLable alloc]init];
        //UIViewController *vc = self.childViewControllers[i];
        //lbl1.text =vc.title;
        if(i == 1){
            lbl1.text =@"星期一";
        }else if(i == 2){
            lbl1.text =@"星期二";
        }else if(i == 3){
            lbl1.text =@"星期三";
        }else if(i == 4){
            lbl1.text =@"星期四";
        }else if(i == 5){
            lbl1.text =@"星期五";
        }else if(i == 6){
            lbl1.text =@"星期六";
        }else if(i == 7){
            lbl1.text =@"星期天";
        }
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        [self.smallScrollView addSubview:lbl1];
        lbl1.tag = i;
        lbl1.textColor = [UIColor whiteColor];
        lbl1.userInteractionEnabled = YES;
        
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    self.smallScrollView.contentSize = CGSizeMake(70 * 7, 0);
    
}


/** 标题栏label的点击事件 */
- (void)lblClick:(UITapGestureRecognizer *)recognizer
{
    if(_btnTag != nil){
        int tag = [_btnTag integerValue];
        SXTitleLable *oldTitlelable = (SXTitleLable*)[self.smallScrollView viewWithTag:tag];
        oldTitlelable.textColor = [UIColor whiteColor];
        oldTitlelable.font = [UIFont systemFontOfSize:16];
    }
    
    SXTitleLable *titlelable = (SXTitleLable *)recognizer.view;
    titlelable.textColor = [UIColor redColor];
    titlelable.font = [UIFont systemFontOfSize:24];
    _btnTag = [NSString stringWithFormat:@"%d",titlelable.tag];
}


/** 正在滚动 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    SXTitleLable *labelLeft = self.smallScrollView.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.smallScrollView.subviews.count) {
        SXTitleLable *labelRight = self.smallScrollView.subviews[rightIndex];
        labelRight.scale = scaleRight;
    }
    
}

-(void)meetingDetail:(UITapGestureRecognizer*)sender{
    BSMeetingTableViewController *mettingTVC = [[BSMeetingTableViewController alloc] init];
    _tittleName = @"行政管理会议";
    self.navigationController.title = @"行政管理";
    [self.navigationController pushViewController:mettingTVC animated:YES];
}

-(void)meetingDetail2:(UITapGestureRecognizer*)sender{
    BSMeetingTableViewController *mettingTVC = [[BSMeetingTableViewController alloc] init];
    _tittleName = @"专项工作";
    self.navigationController.title = @"专项工作";
    [self.navigationController pushViewController:mettingTVC animated:YES];
}

-(void)meetingDetail3:(UITapGestureRecognizer*)sender{
    BSMeetingTableViewController *mettingTVC = [[BSMeetingTableViewController alloc] init];
    _tittleName = @"党群会议";
    self.navigationController.title = @"党群会议";
    [self.navigationController pushViewController:mettingTVC animated:YES];
}

-(void)meetingDetail4:(UITapGestureRecognizer*)sender{
    BSMeetingTableViewController *mettingTVC = [[BSMeetingTableViewController alloc] init];
    _tittleName = @"生产例会";
    
    self.navigationController.title = @"生产例会";
    [self.navigationController pushViewController:mettingTVC animated:YES];
}

//往目标控制器传递数据(顺传)
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //segue有三个属性：1来源控制器，2identity，3目标控制器
    NSLog(@"进来啦！！！");
    [segue.destinationViewController setTitle:_tittleName];
}

@end
