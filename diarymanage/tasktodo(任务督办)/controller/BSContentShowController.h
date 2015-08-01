//
//  BSContentShowController.h
//  diarymanage
//
//  Created by wosinC on 15/7/31.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskTodoInfo;
@interface BSContentShowController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *assignPeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *responsePeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *department;
@property (weak, nonatomic) IBOutlet UILabel *taskOffice;
@property (weak, nonatomic) IBOutlet UILabel *taskRecordLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskSourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *completeTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UILabel *officeLeaderLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressTittleLabel;
@property(strong,nonatomic) UILabel* createTimeTittleLabel;
@property(strong,nonatomic) UILabel* createTimeLabel;
@property(strong,nonatomic) UILabel* taskUndertakeTittleLabel;
@property(strong,nonatomic) UILabel* taskUndertakeLabel;
@property(strong,nonatomic) UILabel* secretaryTittleLabel;
@property(strong,nonatomic) UILabel* secretaryLabel;
@property(strong,nonatomic) UILabel* taskTittleLabel;
@property(strong,nonatomic) UILabel* taskTittleTittleLabel;
@property(strong,nonatomic) UILabel* taskContentTittleLabel;
@property(strong,nonatomic) UILabel* taskContentLabel;
@property(strong,nonatomic) UILabel* taskCompletionTittleLabel;
@property(strong,nonatomic) UILabel* taskCompletionLabel;
@property(strong,nonatomic) UILabel* backHistoryTittleLabel;
@property(strong,nonatomic) UILabel* backHistoryLabel;
@property(strong,nonatomic) TaskTodoInfo* taskTodoInfo;
@end
