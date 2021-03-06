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
#import "BSContentShowController.h"
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
    _taskSourceLabel.text = taskTodoInfo.taskSource;
    _assignPeopleLabel.text = taskTodoInfo.assignPeople;
    _completeTimeLabel.text = taskTodoInfo.completeTime;
}
- (IBAction)workFlowShow:(WorkFlowButton *)sender {
     WorkFlow *demoVC = [[WorkFlow alloc] initWithNibName:@"WorkFlow" bundle:[NSBundle mainBundle]];
    demoVC.task_id = sender.task_id;
    TLAlertView *alertView = [[TLAlertView alloc] initWithView:demoVC.view outsideClose:YES];
    [alertView show];
    
}

- (IBAction)contentShow:(UIButton *)sender {
    NSLog(@"点击按钮。。。");
    //调用自身代理方法并传递可用参数，为了让BSTaskTodoController调用代理方实现跳转（失效）
    //[self.delegate taskToCellDelegateDelegateDidClickContentBtn:self :@"test"];
    
    //通过通知实现跳转
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushToContentShow" object:sender];
}
@end
