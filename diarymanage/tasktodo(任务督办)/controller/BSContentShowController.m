//
//  BSContentShowController.m
//  diarymanage
//
//  Created by wosinC on 15/7/31.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSContentShowController.h"
#import "UIView+Extension.h"
#import "TaskTodoInfo.h"
#define ContentShowTittleFont [UIFont systemFontOfSize:18]
#define ContentShowFont [UIFont systemFontOfSize:17]
@interface BSContentShowController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentShowScrollView;

@end

@implementation BSContentShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentShowScrollView.showsHorizontalScrollIndicator = NO;
    self.contentShowScrollView.showsVerticalScrollIndicator = NO;
    self.contentShowScrollView.contentSize = CGSizeMake(0, 480*3);
    [self addUI];
    [self setDateAndFrame];
}

-(void) addUI{
    CGFloat progressTittleX = self.progressTittleLabel.x;
    CGFloat progressTittleY = self.progressTittleLabel.y;
    CGFloat progressTittleWidth = self.progressTittleLabel.width;
    CGFloat progressTittleHeight = self.progressTittleLabel.height;
    
    /**
     * 实际完成时间
     */
   _createTimeTittleLabel = [[UILabel alloc]init];
    _createTimeTittleLabel.frame = CGRectMake(progressTittleX, progressTittleY+40, progressTittleWidth, progressTittleHeight);
    [_contentShowScrollView addSubview:self.createTimeTittleLabel];
    _createTimeTittleLabel.text = @"实际完成时间：";
    _createTimeTittleLabel.textColor = [UIColor whiteColor];
    _createTimeTittleLabel.textAlignment = UITextAlignmentRight;
    _createTimeTittleLabel.font = ContentShowTittleFont;
    
    _createTimeLabel = [[UILabel alloc]init];
    _createTimeLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.createTimeLabel];
    
    /**
     * 任务录入人
     */
    _taskUndertakeTittleLabel = [[UILabel alloc]init];
    _taskUndertakeTittleLabel.frame = CGRectMake(progressTittleX, progressTittleY+80, progressTittleWidth, progressTittleHeight);
    [_contentShowScrollView addSubview:self.taskUndertakeTittleLabel];
    _taskUndertakeTittleLabel.text = @"任务录入人：";
    _taskUndertakeTittleLabel.textColor = [UIColor whiteColor];
    _taskUndertakeTittleLabel.textAlignment = UITextAlignmentRight;
    _taskUndertakeTittleLabel.font = ContentShowTittleFont;
    
    _taskUndertakeLabel = [[UILabel alloc]init];
    _taskUndertakeLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.taskUndertakeLabel];
    
    /**
     * 督办秘书
     */
    _secretaryTittleLabel = [[UILabel alloc]init];
    _secretaryTittleLabel.frame = CGRectMake(progressTittleX, progressTittleY+120, progressTittleWidth, progressTittleHeight);
    [_contentShowScrollView addSubview:self.secretaryTittleLabel];
    _secretaryTittleLabel.text = @"督办秘书：";
    _secretaryTittleLabel.textColor = [UIColor whiteColor];
    _secretaryTittleLabel.textAlignment = UITextAlignmentRight;
    _secretaryTittleLabel.font = ContentShowTittleFont;
    
    _secretaryLabel = [[UILabel alloc]init];
    _secretaryLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.secretaryLabel];
    
    /**
     * 任务说明
     */
    _taskContentTittleLabel = [[UILabel alloc]init];
    _taskContentTittleLabel.frame = CGRectMake(progressTittleX, progressTittleY+160, progressTittleWidth, progressTittleHeight);
    [_contentShowScrollView addSubview:self.taskContentTittleLabel];
    _taskContentTittleLabel.text = @"任务说明：";
    _taskContentTittleLabel.textColor = [UIColor whiteColor];
    _taskContentTittleLabel.textAlignment = UITextAlignmentRight;
    _taskContentTittleLabel.font = ContentShowTittleFont;
    
    _secretaryLabel = [[UILabel alloc]init];
    _secretaryLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.secretaryLabel];
    
    /**
     * 完成情况说明
     */
    _taskCompletionTittleLabel = [[UILabel alloc]init];
    _taskCompletionTittleLabel.font = ContentShowTittleFont;
    [_contentShowScrollView addSubview:self.taskCompletionTittleLabel];
    
    _taskCompletionLabel = [[UILabel alloc]init];
    _taskCompletionLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.taskCompletionLabel];
    
    /**
     * 回退历史
     */
    _backHistoryTittleLabel = [[UILabel alloc]init];
    _backHistoryTittleLabel.font = ContentShowTittleFont;
    [_contentShowScrollView addSubview:self.backHistoryTittleLabel];
    
    _backHistoryLabel = [[UILabel alloc]init];
    _backHistoryLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.backHistoryLabel];
    
}

-(void)setDateAndFrame{
    
    //XIB页面上已有的Lable添加数据
    _assignPeopleLabel.text =self.taskTodoInfo.assignPeople;
    _responsePeopleLabel.text = self.taskTodoInfo.responsePeople;
    _department.text = self.taskTodoInfo.department;
    _taskOffice.text = self.taskTodoInfo.taskOffice;
    _taskRecordLabel.text = self.taskTodoInfo.taskRecord;
    _taskSourceLabel.text = self.taskTodoInfo.taskSource;
    _completeTimeLabel.text = self.taskTodoInfo.completeTime;
    _progressLabel.text = self.taskTodoInfo.progress;
    _officeLeaderLabel.text = self.taskTodoInfo.officeLeader;
    
    //计算生成Frame的Label数据
    CGFloat progressX = self.progressLabel.x;
    CGFloat progressY = self.progressLabel.y;
    CGFloat progressWidth = self.progressLabel.width;
    CGFloat progressHeight = self.progressLabel.height;
    
    _createTimeLabel.text = self.taskTodoInfo.createTime;
    _createTimeLabel.frame = CGRectMake(progressX, progressY+40, progressWidth, progressHeight);
    
    _secretaryLabel.text = self.taskTodoInfo.secretary;
    _createTimeLabel.frame = CGRectMake(progressX, progressY+80, progressWidth, progressHeight);
}
@end
