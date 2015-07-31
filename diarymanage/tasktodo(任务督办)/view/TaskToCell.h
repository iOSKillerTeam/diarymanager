//
//  TaskToCell.h
//  diarymanage
//
//  Created by 吴新超 on 15/6/23.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class TaskToCell;
//@protocol TaskToCellDelegate<NSObject>
//-(void)taskToCellDelegateDelegateDidClickContentBtn:(TaskToCell*)taskToCell :(NSString*) content;
//@end
@class TaskTodoInfo;
@interface TaskToCell : UITableViewCell
- (IBAction)workFlowShow:(UIButton *)sender;
//@property (weak,nonatomic) id<TaskToCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *taskTittleLabel;
@property (weak, nonatomic) IBOutlet UILabel *headLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskSourceLabel;
@property (weak, nonatomic) IBOutlet UIButton *contentBtn;
@property (weak, nonatomic) IBOutlet UIButton *workFlowBtn;
@property (weak, nonatomic) IBOutlet UILabel *assignPeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *completeTimeLabel;
@property (strong,nonatomic) TaskTodoInfo *taskTodoInfo;
+(id)taskToCell;
@end
