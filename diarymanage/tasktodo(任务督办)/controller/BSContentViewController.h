//
//  BSContentViewController.h
//  diarymanage
//
//  Created by wosinC on 15/8/10.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskTodoInfo;
@interface BSContentViewController : UIViewController
@property (strong, nonatomic) UILabel *assignPeopleLabel;
@property (strong, nonatomic) UILabel *responsePeopleLabel;
@property (strong, nonatomic) UILabel *department;
@property (strong, nonatomic) UILabel *taskOffice;
@property (strong, nonatomic) UILabel *taskRecordLabel;
@property (strong, nonatomic) UILabel *taskSourceLabel;
@property (strong, nonatomic) UILabel *completeTimeLabel;
@property (strong, nonatomic) UILabel *progressLabel;
@property (strong, nonatomic) UILabel *officeLeaderLabel;
@property (strong, nonatomic) UILabel *progressTittleLabel;
@property (strong, nonatomic) UILabel* createTimeTittleLabel;
@property (strong, nonatomic) UILabel* createTimeLabel;
@property (strong, nonatomic) UILabel* taskUndertakeTittleLabel;
@property (strong, nonatomic) UILabel* taskUndertakeLabel;
@property (strong, nonatomic) UILabel* secretaryTittleLabel;
@property (strong, nonatomic) UILabel* secretaryLabel;
@property (strong, nonatomic) UILabel* taskTittleLabel;
@property (strong, nonatomic) UILabel* taskTittleTittleLabel;
@property (strong, nonatomic) UILabel* taskContentTittleLabel;
@property (strong, nonatomic) UILabel* taskContentLabel;
@property (strong, nonatomic) UILabel* taskCompletionTittleLabel;
@property (strong, nonatomic) UILabel* taskCompletionLabel;
@property (strong, nonatomic) UILabel* backHistoryTittleLabel;
@property (strong, nonatomic) UILabel* backHistoryLabel;
@property (strong, nonatomic) TaskTodoInfo* taskTodoInfo;
@end
