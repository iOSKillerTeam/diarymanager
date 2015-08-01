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
     * 任务事项
     */
    _taskTittleTittleLabel = [[UILabel alloc]init];
    _taskTittleTittleLabel.frame = CGRectMake(progressTittleX, progressTittleY+160, progressTittleWidth, progressTittleHeight);
    [_contentShowScrollView addSubview:self.taskTittleTittleLabel];
    _taskTittleTittleLabel.text = @"任务事项：";
    _taskTittleTittleLabel.textColor = [UIColor whiteColor];
    _taskTittleTittleLabel.textAlignment = UITextAlignmentRight;
    _taskTittleTittleLabel.font = ContentShowTittleFont;
    
    _taskTittleLabel = [[UILabel alloc]init];
    _taskTittleLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.taskTittleLabel];
    
    /**
     * 任务说明
     */
    _taskContentTittleLabel = [[UILabel alloc]init];
    [_contentShowScrollView addSubview:self.taskContentTittleLabel];
    _taskContentTittleLabel.text = @"任务说明：";
    _taskContentTittleLabel.textColor = [UIColor whiteColor];
    _taskContentTittleLabel.textAlignment = UITextAlignmentRight;
    _taskContentTittleLabel.font = ContentShowTittleFont;
    
    _taskContentLabel = [[UILabel alloc]init];
    _taskContentLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.taskContentLabel];
    
    /**
     * 完成情况说明
     */
    _taskCompletionTittleLabel = [[UILabel alloc]init];
    [_contentShowScrollView addSubview:self.taskCompletionTittleLabel];
    _taskCompletionTittleLabel.font = ContentShowTittleFont;
    _taskCompletionTittleLabel.textAlignment = UITextAlignmentRight;
    _taskCompletionTittleLabel.textColor = [UIColor whiteColor];
    _taskCompletionTittleLabel.text = @"完成情况说明：";
    
    
    _taskCompletionLabel = [[UILabel alloc]init];
    _taskCompletionLabel.font = ContentShowFont;
    [_contentShowScrollView addSubview:self.taskCompletionLabel];
    
    /**
     * 回退历史
     */
    _backHistoryTittleLabel = [[UILabel alloc]init];
    [_contentShowScrollView addSubview:self.backHistoryTittleLabel];
    _backHistoryTittleLabel.font = ContentShowTittleFont;
    _backHistoryTittleLabel.textAlignment = UITextAlignmentRight;
    _backHistoryTittleLabel.textColor = [UIColor whiteColor];
    _backHistoryTittleLabel.text = @"回退历史：";
    
    
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
    
    _taskUndertakeLabel.text = self.taskTodoInfo.taskUndertake;
    _taskUndertakeLabel.frame = CGRectMake(progressX, progressY+80, progressWidth, progressHeight);
    
    _secretaryLabel.text = self.taskTodoInfo.secretary;
    _secretaryLabel.frame = CGRectMake(progressX, progressY+120, progressWidth, progressHeight);
    
    /**
     * 任务标题
     */
    
    //计算生成Frame的Label数据
    
    /**
     * 任务事项
     */
    _taskTittleLabel.text = self.taskTodoInfo.taskTittle;
    [_taskTittleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskTittleLabel.numberOfLines = 0;
    CGFloat _taskTittleTittleLabelX = self.taskTittleTittleLabel.x;
    CGFloat _taskTittleTittleLabelY = self.taskTittleTittleLabel.y;
    CGFloat contentx = _taskTittleTittleLabelX+60;
    CGFloat contenty = _taskTittleTittleLabelY + 40;
    CGFloat contentWidth = self.view.width-76;
    CGSize size = CGSizeMake(contentWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *attribute = @{NSFontAttributeName: _taskTittleLabel.font};
    CGSize contentsize = [_taskTittleLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    _taskTittleLabel.frame = CGRectMake(contentx, contenty, contentWidth, contentsize.height);
    
    /**
     * 任务说明
     */
    CGFloat  taskContentTittleY = CGRectGetMaxY(_taskTittleLabel.frame) + 19;
    _taskContentTittleLabel.frame = CGRectMake(_taskTittleTittleLabelX, taskContentTittleY, self.taskTittleTittleLabel.width, self.taskTittleTittleLabel.height);
    
    _taskContentLabel.text = self.taskTodoInfo.taskContent;
    [_taskContentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskContentLabel.numberOfLines = 0;
    CGFloat _taskContentTittleX = self.taskContentTittleLabel.x;
    CGFloat _taskContentTittleY = self.taskContentTittleLabel.y;
    CGFloat taskContentx = _taskContentTittleX+60;
    CGFloat taskContenty = _taskContentTittleY + 40;
    CGFloat taskContentWidth = self.view.width-76;
    CGSize taskContentBaseSize = CGSizeMake(contentWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *taskContentAttribute = @{NSFontAttributeName: _taskContentLabel.font};
    CGSize taskcontentsize = [_taskContentLabel.text boundingRectWithSize:taskContentBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:taskContentAttribute context:nil].size;
    _taskContentLabel.frame = CGRectMake(taskContentx, taskContenty, taskContentWidth, taskcontentsize.height);
    
    /**
     * 完成情况说明
     */
    CGFloat  taskCompletionTittleY = CGRectGetMaxY(_taskContentLabel.frame) + 19;
    _taskCompletionTittleLabel.frame = CGRectMake(_taskContentTittleX, taskCompletionTittleY, self.taskContentTittleLabel.width, self.taskContentTittleLabel.height);
    
    _taskCompletionLabel.text = self.taskTodoInfo.taskCompletion;
    [_taskCompletionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskCompletionLabel.numberOfLines = 0;
    CGFloat _taskCompletionLabelX = self.taskCompletionTittleLabel.x + 60;
    CGFloat _taskCompletionLabelY = self.taskCompletionTittleLabel.y + 40;
    CGFloat completionWidth = self.view.width-76;
    CGSize completionBaseSize = CGSizeMake(completionWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *completionAttribute = @{NSFontAttributeName: _taskCompletionLabel.font};
    CGSize completionSize = [_taskCompletionLabel.text boundingRectWithSize:completionBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:completionAttribute context:nil].size;
    _taskCompletionLabel.frame = CGRectMake(_taskCompletionLabelX, _taskCompletionLabelY, completionWidth, completionSize.height);
    
    /**
     * 回退历史
     */
    CGFloat  backHistoryTittleY = CGRectGetMaxY(_taskCompletionLabel.frame) + 19;
    _backHistoryTittleLabel.frame = CGRectMake(_taskContentTittleX, backHistoryTittleY, self.taskContentTittleLabel.width, self.taskContentTittleLabel.height);

    _backHistoryLabel.text = self.taskTodoInfo.backHistory;
    [_backHistoryLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _backHistoryLabel.numberOfLines = 0;
    CGFloat backHistoryLabelX = self.backHistoryTittleLabel.x + 60;
    CGFloat backHistoryLabelY = self.backHistoryTittleLabel.y + 40;
    CGFloat backHistoryWidth = self.view.width-76;
    CGSize backHistoryBaseSize = CGSizeMake(backHistoryWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *backHistoryAttribute = @{NSFontAttributeName: _backHistoryLabel.font};
    CGSize backHistorySize = [_backHistoryLabel.text boundingRectWithSize:backHistoryBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:backHistoryAttribute context:nil].size;
    _backHistoryLabel.frame = CGRectMake(backHistoryLabelX, backHistoryLabelY, backHistoryWidth, backHistorySize.height);
    
    self.contentShowScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_backHistoryLabel.frame) + 19);
}
@end
