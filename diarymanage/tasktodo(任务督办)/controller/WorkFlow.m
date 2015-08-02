//
//  WorkFlow.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/24.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "WorkFlow.h"
#import "UIView+Extension.h"
#define StatusCellMagin 20
@interface WorkFlow ()
@property (weak, nonatomic) IBOutlet UIScrollView *workflowScrollView;
@property (strong,nonatomic) NSArray* workFlows;
@end

@implementation WorkFlow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //通过此条督办任务的t_id找到对应t_id的流程步骤
    NSLog(@"%@",self.task_id);
    _workFlows = @[@{@"t_id":@"1",@"taskname":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"ropera_step":@"处室负责人审批",@"opera_time":@"2015-07-30 11:23",@"opera_per":@"王瑶",@"next_opera_per":@"张珊"},@{@"t_id":@"1",@"taskname":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"ropera_step":@"分管领导审批",@"opera_time":@"2015-07-30 12:33",@"opera_per":@"张珊",@"next_opera_per":@"何炅"},@{@"t_id":@"1",@"taskname":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"ropera_step":@"主管领导审批",@"opera_time":@"2015-07-31 09:11",@"opera_per":@"何炅",@"next_opera_per":@"王岚"},@{@"t_id":@"1",@"taskname":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"ropera_step":@"主管领导回退",@"opera_time":@"2015-07-31 13:23",@"opera_per":@"王岚",@"next_opera_per":@"何炅"},@{@"t_id":@"1",@"taskname":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"ropera_step":@"分管领导审批",@"opera_time":@"2015-07-31 14:43",@"opera_per":@"何炅",@"next_opera_per":@"王岚"},@{@"t_id":@"1",@"taskname":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"ropera_step":@"主管领导审批",@"opera_time":@"2015-07-31 15:03",@"opera_per":@"王岚",@"next_opera_per":@"琴川"},@{@"t_id":@"1",@"taskname":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"ropera_step":@"总经理审批",@"opera_time":@"2015-07-31 16:03",@"opera_per":@"琴川",@"next_opera_per":@"审批完成"}];
    self.workflowScrollView.contentSize = CGSizeMake(0, 480*2);
    [self addWorkFlow];
}

-(void)addWorkFlow{
    for(int i=0;i<_workFlows.count;i++){
        UIImageView *workStepImageView = [[UIImageView alloc]init];
        UIImageView *arrowImageView = [[UIImageView alloc]init];
        CGFloat imageWidth = self.view.width/4;
        CGFloat imageHeight = imageWidth;
        
        
        CGFloat baseArrowX = 20 + imageWidth + StatusCellMagin;
        
        CGFloat arrowWidth = (self.view.width - 40 - imageWidth*2)-StatusCellMagin*2;
        CGFloat arrowHeight = imageHeight;
        if(i==0){
    
            UIImage* workStepImage = [UIImage imageNamed:@"round1.png"];
            workStepImageView.image = workStepImage;
            workStepImageView.frame = CGRectMake(20, 20, imageWidth, imageHeight);
            [self.workflowScrollView addSubview:workStepImageView];
            
            UIImage* arrowImage = [UIImage imageNamed:@"arrow1.png"];
            arrowImageView.image = arrowImage;
            CGFloat arrowX = CGRectGetMaxX(workStepImageView.frame) + StatusCellMagin;
            CGFloat arrowY = CGRectGetMaxY(workStepImageView.frame) ;
            arrowImageView.frame = CGRectMake(arrowX, arrowY, arrowWidth, arrowHeight);
            [self.workflowScrollView addSubview:arrowImageView];
            
        }if(i==1){
            
            UIImage* workStepImage = [UIImage imageNamed:@"round2.png"];
            workStepImageView.image = workStepImage;
            workStepImageView.frame = CGRectMake(self.view.width-20-imageWidth, 20+imageHeight*2, imageWidth, imageHeight);
            [self.workflowScrollView addSubview:workStepImageView];
            
            UIImage* arrowImage = [UIImage imageNamed:@"arrow2.png"];
            arrowImageView.image = arrowImage;
            
            CGFloat arrowY = CGRectGetMaxY(workStepImageView.frame);
            arrowImageView.frame = CGRectMake(baseArrowX, arrowY, arrowWidth, arrowHeight);
            [self.workflowScrollView addSubview:arrowImageView];
            
        }if(i==2){
            
            UIImage* workStepImage = [UIImage imageNamed:@"round3.png"];
            workStepImageView.image = workStepImage;
            workStepImageView.frame = CGRectMake(20, 20+imageHeight+imageHeight*3, imageWidth, imageHeight);
            [self.workflowScrollView addSubview:workStepImageView];
            
            UIImage* arrowImage = [UIImage imageNamed:@"arrow1.png"];
            CGFloat arrowY = CGRectGetMaxY(workStepImageView.frame);
            arrowImageView.frame = CGRectMake(baseArrowX, arrowY, arrowWidth, arrowHeight);
            arrowImageView.image = arrowImage;
            
            [self.workflowScrollView addSubview:arrowImageView];
            
        }
        
    }
}

@end
