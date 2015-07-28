//
//  TaskToCell.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/23.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "TaskToCell.h"
#import "TaskTodoInfo.h"
#import "TLAlertView.h"
#import "WorkFlow.h"
@implementation TaskToCell

+(id)taskToCell{
    return [[NSBundle mainBundle] loadNibNamed:@"TaskToCell" owner:nil options:nil][0];
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return  self;
}
-(void)setTaskTodoInfo:(TaskTodoInfo *)taskTodoInfo{
    _taskTittleLabel.text = taskTodoInfo.taskTittle;
    _headLabel.text = taskTodoInfo.head;
    _createTimeLabel.text = taskTodoInfo.createTime;
}
- (IBAction)workFlowShow:(UIButton *)sender {
     WorkFlow *demoVC = [[WorkFlow alloc] initWithNibName:@"WorkFlow" bundle:[NSBundle mainBundle]];
    TLAlertView *alertView = [[TLAlertView alloc] initWithView:demoVC.view outsideClose:YES];
    [alertView show];
    
}
@end
