//
//  BSContentViewController.m
//  diarymanage
//
//  Created by wosinC on 15/8/10.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSContentViewController.h"
#import "ZIOMenuView.h"
#import "UIView+Extension.h"
#import "TaskTodoInfo.h"
#define ContentShowFont [UIFont systemFontOfSize:15]
#define WXCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface BSContentViewController ()<ZIOMenuViewDelegate>
@property(strong,nonatomic)UIScrollView *leftMenuScroll;
@property(strong,nonatomic)UIScrollView *mainContentScroll;
@property(strong,nonatomic)UIView * tittleView;
@property(strong,nonatomic)UIView * taskContentView;
@property(strong,nonatomic)UIView * taskCompletionView;
@property(strong,nonatomic)UIView * assignPeopleView;
@property(strong,nonatomic)UIView * responsePeopleView;
@property(strong,nonatomic)UIView * taskRecordView;
@property(strong,nonatomic)UIView * taskUndertakeView;
@property(strong,nonatomic)UIView * departmentView;
@property(strong,nonatomic)UIView * officeLeaderView;
@property(strong,nonatomic)UIView * taskOfficeView;
@property(strong,nonatomic)UIView * taskSourceView;
@property(strong,nonatomic)UIView * completeTimeView;
@property(strong,nonatomic)UIView * createTimeView;
@property(strong,nonatomic)UIView * progressView;
@property(strong,nonatomic)UIView * secretaryView;
@property(strong,nonatomic)UIView * backHistoryView;
@end

@implementation BSContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WXCColor(60, 255, 150);
    _leftMenuScroll = [[UIScrollView alloc]init];
    _leftMenuScroll.scrollEnabled = YES;
    _leftMenuScroll.frame = CGRectMake(self.view.width-self.view.width/3, 0, self.view.width/3,self.view.height);
    
    [self.view addSubview:_leftMenuScroll];
    
    [self addMenuBtn];
    
    [self addMoveViewAndSetUI];

}

/**
 *  目录代理方法 目录打开时
 *
 *  @param menuView 目录view
 */
-(void)menuViewDidOpenMenu:(ZIOMenuView *)menuView
{
    if (menuView.menuViewStatus == ZIOMenuViewLeftOpen) {//判断状态
        NSLog(@"left open");
    }
    else{
        NSLog(@"right open");
    }
}
/**
 *  目录代理方法 目录关闭时
 *
 *  @param menuView 目录view
 */
-(void)menuViewDidCloseMenu:(ZIOMenuView *)menuView
{
    NSLog(@"close");
}

/**
 *  目录代理方法 自定义遮盖view
 *
 *  @param menuView 目录view
 *
 *  @return 遮盖view
 */
//-(UIView *)menuViewForCoverView:(ZIOMenuView *)menuView
//{
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = WXCColor(60, 255, 150);
//    return redView;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) addMenuBtn{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"任务事项" forState:UIControlStateNormal] ;
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [_leftMenuScroll addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]init];
    [btn2 setTitle:@"任务说明" forState:UIControlStateNormal] ;
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(0, CGRectGetMaxY(btn.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn2.backgroundColor = [UIColor blueColor];
    [btn2 addTarget:self action:@selector(btntwoclick) forControlEvents:UIControlEventTouchUpInside];
    [_leftMenuScroll addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]init];
    [btn3 setTitle:@"完成情况" forState:UIControlStateNormal] ;
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnthreeclick) forControlEvents:UIControlEventTouchUpInside];
    btn3.frame = CGRectMake(0, CGRectGetMaxY(btn2.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn3.backgroundColor = [UIColor grayColor];
    [_leftMenuScroll addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc]init];
    [btn4 setTitle:@"人物对象" forState:UIControlStateNormal] ;
    [btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btnfourclick) forControlEvents:UIControlEventTouchUpInside];
    btn4.frame = CGRectMake(0, CGRectGetMaxY(btn3.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn4.backgroundColor = [UIColor orangeColor];
    [_leftMenuScroll addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]init];
    [btn5 setTitle:@"主办处室" forState:UIControlStateNormal] ;
    [btn5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(btnfiveclick) forControlEvents:UIControlEventTouchUpInside];
    btn5.frame = CGRectMake(0, CGRectGetMaxY(btn4.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn5.backgroundColor = [UIColor redColor];
    [_leftMenuScroll addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc]init];
    [btn6 setTitle:@"任务来源" forState:UIControlStateNormal] ;
    [btn6 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(btnsixclick) forControlEvents:UIControlEventTouchUpInside];
    btn6.frame = CGRectMake(0, CGRectGetMaxY(btn5.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn6.backgroundColor = [UIColor greenColor];
    [_leftMenuScroll addSubview:btn6];
    
    UIButton *btn7 = [[UIButton alloc]init];
    [btn7 setTitle:@"计划时间" forState:UIControlStateNormal] ;
    [btn7 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn7 addTarget:self action:@selector(btnsevenclick) forControlEvents:UIControlEventTouchUpInside];
    btn7.frame = CGRectMake(0, CGRectGetMaxY(btn6.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn7.backgroundColor = [UIColor purpleColor];
    [_leftMenuScroll addSubview:btn7];
    
    UIButton *btn8 = [[UIButton alloc]init];
    [btn8 setTitle:@"实际时间" forState:UIControlStateNormal] ;
    [btn8 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn8 addTarget:self action:@selector(btneightclick) forControlEvents:UIControlEventTouchUpInside];
    btn8.frame = CGRectMake(0, CGRectGetMaxY(btn7.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn8.backgroundColor = [UIColor blackColor];
    [_leftMenuScroll addSubview:btn8];
    
    UIButton *btn9 = [[UIButton alloc]init];
    [btn9 setTitle:@"进展情况" forState:UIControlStateNormal] ;
    [btn9 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn9 addTarget:self action:@selector(btnnineclick) forControlEvents:UIControlEventTouchUpInside];
    btn9.frame = CGRectMake(0, CGRectGetMaxY(btn8.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn9.backgroundColor = [UIColor orangeColor];
    [_leftMenuScroll addSubview:btn9];
    
    UIButton *btn10 = [[UIButton alloc]init];
    [btn10 setTitle:@"进展情况" forState:UIControlStateNormal] ;
    [btn10 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn10 addTarget:self action:@selector(btntenclick) forControlEvents:UIControlEventTouchUpInside];
    btn10.frame = CGRectMake(0, CGRectGetMaxY(btn9.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn10.backgroundColor = [UIColor magentaColor];
    [_leftMenuScroll addSubview:btn10];
    
    UIButton *btn11 = [[UIButton alloc]init];
    [btn11 setTitle:@"回退历史" forState:UIControlStateNormal] ;
    [btn11 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn11 addTarget:self action:@selector(btnelevenclick) forControlEvents:UIControlEventTouchUpInside];
    btn11.frame = CGRectMake(0, CGRectGetMaxY(btn10.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn11.backgroundColor = [UIColor cyanColor];
    [_leftMenuScroll addSubview:btn11];
    
    _leftMenuScroll.contentSize = CGSizeMake(self.view.width/3, CGRectGetMaxY(btn11.frame));
    

}

-(void) btnclick{
    CGPoint position = CGPointMake(0, _tittleView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btntwoclick{
    CGPoint position = CGPointMake(0, _taskContentView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btnthreeclick{
    CGPoint position = CGPointMake(0, _taskCompletionView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btnfourclick{
    CGPoint position = CGPointMake(0, _assignPeopleView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btnfiveclick{
    CGPoint position = CGPointMake(0, _taskOfficeView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btnsixclick{
    CGPoint position = CGPointMake(0, _taskSourceView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btnsevenclick{
    CGPoint position = CGPointMake(0, _completeTimeView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btneightclick{
    CGPoint position = CGPointMake(0, _createTimeView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btnnineclick{
    CGPoint position = CGPointMake(0, _progressView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btntenclick{
    CGPoint position = CGPointMake(0, _secretaryView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) btnelevenclick{
    CGPoint position = CGPointMake(0, _backHistoryView.y-74);
    //_taskCompletionView.backgroundColor = [UIColor whiteColor];
    [_mainContentScroll setContentOffset:position animated:YES];
}
-(void) addMoveViewAndSetUI{
    // Do any additional setup after loading the view from its nib.
    //    ZIOMenuView *moveView = [ZIOMenuView menuViewWithLeftViewWidth:130 andRightWidth:100];
    ZIOMenuView *moveView = [[ZIOMenuView alloc] init];
    //设置颜色 （默认白色背景）
    moveView.backgroundColor = WXCColor(140, 255, 150);
    
    [self setMoveViewContentFrame];
    
    [moveView addSubview:_mainContentScroll];
    [self.view addSubview:moveView];
    //设置左边目录宽度 （默认0）
    // moveView.leftViewWidth = self.view.width/3;
    //设置右边目录宽度（默认0）
    moveView.rightViewWidth = self.view.width/3;;
    //代理
    moveView.delegate = self;
    //开启遮盖view （默认NO）
    moveView.cover = YES;
    //设置动画时间 （默认0.3秒）
    moveView.animateTime = 0.2;
    //设置移动比例 ，（默认0.3）
    moveView.moveRatio = 0.35;
}

-(void) setMoveViewContentFrame{
    /**
     * 主要内容的scrollview容器
     */
    _mainContentScroll = [[UIScrollView alloc]init];
    _mainContentScroll.scrollEnabled = YES;
    _mainContentScroll.frame = CGRectMake(0, 0, self.view.width,self.view.height);
    
    /**
     * 任务事项
     */
    _tittleView = [[UIView alloc]init];
    _tittleView.backgroundColor = WXCColor(230, 255, 230);
    [_tittleView.layer setCornerRadius:10.0];
    _taskTittleLabel = [[UILabel alloc]init];
    _taskTittleLabel.font = ContentShowFont;
    _taskTittleLabel.text = [NSString stringWithFormat:@"任务事项：%@",self.taskTodoInfo.taskTittle];
    [_taskTittleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskTittleLabel.numberOfLines = 0;
    CGFloat contentx = 20;
    CGFloat contenty = 20;
    CGFloat contentWidth = self.view.width-50;
    CGSize size = CGSizeMake(contentWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *attribute = @{NSFontAttributeName: _taskTittleLabel.font};
    CGSize contentsize = [_taskTittleLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    [_tittleView addSubview:_taskTittleLabel];
    _tittleView.frame = CGRectMake(10, 74, self.view.width-20, contentsize.height+30);
    _taskTittleLabel.frame = CGRectMake(contentx, contenty, contentWidth, contentsize.height);
    [_mainContentScroll addSubview:_tittleView];
    
    /**
     * 任务说明
     */
    _taskContentView = [[UIView alloc]init];
    _taskContentView.backgroundColor = WXCColor(230, 255, 230);
    [_taskContentView.layer setCornerRadius:10.0];
    _taskContentLabel = [[UILabel alloc]init];
    _taskContentLabel.font = ContentShowFont;
    _taskContentLabel.text = [NSString stringWithFormat:@"任务说明：%@",self.taskTodoInfo.taskContent];
    [_taskContentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskContentLabel.numberOfLines = 0;
    CGFloat taskContentx = 20;
    CGFloat taskContenty = 20;
    CGFloat taskContentWidth = self.view.width-50;
    CGSize taskContentBaseSize = CGSizeMake(taskContentWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *taskContentAttribute = @{NSFontAttributeName: _taskContentLabel.font};
    CGSize taskContentsize = [_taskContentLabel.text boundingRectWithSize:taskContentBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:taskContentAttribute context:nil].size;
    [_taskContentView addSubview:_taskContentLabel];
    _taskContentView.frame = CGRectMake(10, CGRectGetMaxY(_tittleView.frame)+10, self.view.width-20, taskContentsize.height+30);
    _taskContentLabel.frame = CGRectMake(taskContentx, taskContenty, taskContentWidth, taskContentsize.height);
    [_mainContentScroll addSubview:_taskContentView];
    
    /**
     * 完成情况说明
     */
    _taskCompletionView = [[UIView alloc]init];
    _taskCompletionView.backgroundColor = WXCColor(230, 255, 230);
    [_taskCompletionView.layer setCornerRadius:10.0];
    _taskCompletionLabel = [[UILabel alloc]init];
    _taskCompletionLabel.font = ContentShowFont;
    _taskCompletionLabel.text = [NSString stringWithFormat:@"完成情况说明：%@",self.taskTodoInfo.taskCompletion];
    [_taskCompletionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskCompletionLabel.numberOfLines = 0;
    CGFloat taskCompletionx = 20;
    CGFloat taskCompletiony = 20;
    CGFloat taskCompletionxWidth = self.view.width-50;
    CGSize taskCompletionBaseSize = CGSizeMake(taskCompletionxWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *taskCompletionAttribute = @{NSFontAttributeName: _taskCompletionLabel.font};
    CGSize taskCompletionsize = [_taskCompletionLabel.text boundingRectWithSize:taskCompletionBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:taskCompletionAttribute context:nil].size;
    [_taskCompletionView addSubview:_taskCompletionLabel];
    _taskCompletionView.frame = CGRectMake(10, CGRectGetMaxY(_taskContentView.frame)+10, self.view.width-20, taskCompletionsize.height+30);
    _taskCompletionLabel.frame = CGRectMake(taskCompletionx, taskCompletiony, taskCompletionxWidth, taskCompletionsize.height);
    [_mainContentScroll addSubview:_taskCompletionView];
    
    /**
     * 任务指派人
     */
    _assignPeopleView = [[UIView alloc]init];
    _assignPeopleView.backgroundColor = WXCColor(230, 255, 230);
    [_assignPeopleView.layer setCornerRadius:10.0];
    _assignPeopleLabel = [[UILabel alloc]init];
    _assignPeopleLabel.font = ContentShowFont;
    _assignPeopleLabel.text = [NSString stringWithFormat:@"指派人：%@",self.taskTodoInfo.assignPeople];
    [_assignPeopleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _assignPeopleLabel.numberOfLines = 0;
    CGFloat assignPeoplex = 20;
    CGFloat assignPeopley = 20;
    CGFloat assignPeopleWidth = (self.view.width-50)/2-5;
    CGSize assignPeopleBaseSize = CGSizeMake(assignPeopleWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *assignPeopleAttribute = @{NSFontAttributeName: _assignPeopleLabel.font};
    CGSize assignPeoplesize = [_assignPeopleLabel.text boundingRectWithSize:assignPeopleBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:assignPeopleAttribute context:nil].size;
    [_assignPeopleView addSubview:_assignPeopleLabel];
    _assignPeopleView.frame = CGRectMake(10, CGRectGetMaxY(_taskCompletionView.frame)+10, (self.view.width-20)/2-5, assignPeoplesize.height+30);
    _assignPeopleLabel.frame = CGRectMake(assignPeoplex, assignPeopley, assignPeopleWidth, assignPeoplesize.height);
    [_mainContentScroll addSubview:_assignPeopleView];
    
    /**
     * 任务主责人
     */
    _responsePeopleView = [[UIView alloc]init];
    _responsePeopleView.backgroundColor = WXCColor(230, 255, 230);
    [_responsePeopleView.layer setCornerRadius:10.0];
    _responsePeopleLabel = [[UILabel alloc]init];
    _responsePeopleLabel.font = ContentShowFont;
    _responsePeopleLabel.text = [NSString stringWithFormat:@"主责人：%@",self.taskTodoInfo.responsePeople];
    [_responsePeopleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _responsePeopleLabel.numberOfLines = 0;
    
    CGFloat responsePeoplex = 20;
    CGFloat responsePeopley = 20;

    [_responsePeopleView addSubview:_responsePeopleLabel];
    _responsePeopleView.frame = CGRectMake(CGRectGetMaxX(_assignPeopleView.frame)+5, _assignPeopleView.y, _assignPeopleView.width, _assignPeopleView.height);
    _responsePeopleLabel.frame = CGRectMake(responsePeoplex, responsePeopley, assignPeopleWidth, assignPeoplesize.height);
    [_mainContentScroll addSubview:_responsePeopleView];
    
    /**
     * 承办人
     */
    _taskRecordView = [[UIView alloc]init];
    _taskRecordView.backgroundColor = WXCColor(230, 255, 230);
    [_taskRecordView.layer setCornerRadius:10.0];
    _taskRecordLabel = [[UILabel alloc]init];
    _taskRecordLabel.font = ContentShowFont;
    _taskRecordLabel.text = [NSString stringWithFormat:@"承办人：%@",self.taskTodoInfo.taskRecord];
    [_taskRecordLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskRecordLabel.numberOfLines = 0;
    CGFloat taskRecordx = 20;
    CGFloat taskRecordy = 20;
    CGFloat taskRecordWidth = (self.view.width-50)/2-5;
    CGSize taskRecordBaseSize = CGSizeMake(taskRecordWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *taskRecordAttribute = @{NSFontAttributeName: _taskRecordLabel.font};
    CGSize taskRecordsize = [_taskRecordLabel.text boundingRectWithSize:taskRecordBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:taskRecordAttribute context:nil].size;
    [_taskRecordView addSubview:_taskRecordLabel];
    _taskRecordView.frame = CGRectMake(10, CGRectGetMaxY(_assignPeopleView.frame)+10, (self.view.width-20)/2-5, taskRecordsize.height+30);
    _taskRecordLabel.frame = CGRectMake(taskRecordx, taskRecordy, taskRecordWidth, taskRecordsize.height);
    [_mainContentScroll addSubview:_taskRecordView];
    
    /**
     * 录入人
     */
    _taskUndertakeView = [[UIView alloc]init];
    _taskUndertakeView.backgroundColor = WXCColor(230, 255, 230);
    [_taskUndertakeView.layer setCornerRadius:10.0];
    _taskUndertakeLabel = [[UILabel alloc]init];
    _taskUndertakeLabel.font = ContentShowFont;
    _taskUndertakeLabel.text = [NSString stringWithFormat:@"录入人：%@",self.taskTodoInfo.taskUndertake];
    [_taskUndertakeLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskUndertakeLabel.numberOfLines = 0;
    
    CGFloat taskUndertakex = 20;
    CGFloat taskUndertakey = 20;
    
    [_taskUndertakeView addSubview:_taskUndertakeLabel];
    _taskUndertakeView.frame = CGRectMake(CGRectGetMaxX(_taskRecordView.frame)+5, _taskRecordView.y, _taskRecordView.width, _taskRecordView.height);
    _taskUndertakeLabel.frame = CGRectMake(taskUndertakex, taskUndertakey, taskRecordWidth, taskRecordsize.height);
    [_mainContentScroll addSubview:_taskUndertakeView];

    /**
     * 分管领导
     */
    _departmentView = [[UIView alloc]init];
    _departmentView.backgroundColor = WXCColor(230, 255, 230);
    [_departmentView.layer setCornerRadius:10.0];
    _department = [[UILabel alloc]init];
    _department.font = ContentShowFont;
    _department.text = [NSString stringWithFormat:@"分管领导：%@",self.taskTodoInfo.department];
    [_department setLineBreakMode:NSLineBreakByWordWrapping];
    _department.numberOfLines = 0;
    CGFloat departmentx = 20;
    CGFloat departmenty = 20;
    CGFloat departmentWidth = (self.view.width-50)/2-5;
    CGSize departmentBaseSize = CGSizeMake(departmentWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *departmentAttribute = @{NSFontAttributeName: _department.font};
    CGSize departmentsize = [_department.text boundingRectWithSize:departmentBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:departmentAttribute context:nil].size;
    [_departmentView addSubview:_department];
    _departmentView.frame = CGRectMake(10, CGRectGetMaxY(_taskRecordView.frame)+10, (self.view.width-20)/2-5, departmentsize.height+30);
    _department.frame = CGRectMake(departmentx, departmenty, departmentWidth, departmentsize.height);
    [_mainContentScroll addSubview:_departmentView];
    
    /**
     * 处室负责人
     */
    _officeLeaderView = [[UIView alloc]init];
    _officeLeaderView.backgroundColor = WXCColor(230, 255, 230);
    [_officeLeaderView.layer setCornerRadius:10.0];
    _officeLeaderLabel = [[UILabel alloc]init];
    _officeLeaderLabel.font = ContentShowFont;
    _officeLeaderLabel.text = [NSString stringWithFormat:@"处负责人：%@",self.taskTodoInfo.officeLeader];
    [_officeLeaderLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _officeLeaderLabel.numberOfLines = 0;
    
    CGFloat officeLeaderx = 20;
    CGFloat officeLeadery = 20;
    
    [_officeLeaderView addSubview:_officeLeaderLabel];
    _officeLeaderView.frame = CGRectMake(CGRectGetMaxX(_departmentView.frame)+5, _departmentView.y, _departmentView.width, _departmentView.height);
    _officeLeaderLabel.frame = CGRectMake(officeLeaderx, officeLeadery,  departmentWidth, departmentsize.height);
    [_mainContentScroll addSubview:_officeLeaderView];
    
    /**
     * 主办处室
     */
    _taskOfficeView = [[UIView alloc]init];
    _taskOfficeView.backgroundColor = WXCColor(230, 255, 230);
    [_taskOfficeView.layer setCornerRadius:10.0];
    _taskOffice = [[UILabel alloc]init];
    _taskOffice.font = ContentShowFont;
    _taskOffice.text = [NSString stringWithFormat:@"主办处室：%@",self.taskTodoInfo.taskOffice];
    [_taskOffice setLineBreakMode:NSLineBreakByWordWrapping];
    _taskOffice.numberOfLines = 0;
    CGFloat taskOfficex = 20;
    CGFloat taskOfficey = 20;
    CGFloat taskOfficeWidth = self.view.width-50;
    CGSize taskOfficeBaseSize = CGSizeMake(taskOfficeWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *taskOfficeAttribute = @{NSFontAttributeName: _taskOffice.font};
    CGSize taskOfficesize = [_taskOffice.text boundingRectWithSize:taskOfficeBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:taskOfficeAttribute context:nil].size;
    [_taskOfficeView addSubview:_taskOffice];
    _taskOfficeView.frame = CGRectMake(10, CGRectGetMaxY(_departmentView.frame)+10, self.view.width-20, taskOfficesize.height+30);
    _taskOffice.frame = CGRectMake(taskOfficex, taskOfficey, taskOfficeWidth, taskOfficesize.height);
    [_mainContentScroll addSubview:_taskOfficeView];
    
    /**
     * 任务来源
     */
    _taskSourceView = [[UIView alloc]init];
    _taskSourceView.backgroundColor = WXCColor(230, 255, 230);
    [_taskSourceView.layer setCornerRadius:10.0];
    _taskSourceLabel = [[UILabel alloc]init];
    _taskSourceLabel.font = ContentShowFont;
    _taskSourceLabel.text = [NSString stringWithFormat:@"任务来源：%@",self.taskTodoInfo.taskSource];
    [_taskSourceLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _taskSourceLabel.numberOfLines = 0;
    CGFloat taskSourceWidth = self.view.width-50;
    CGSize taskSourceBaseSize = CGSizeMake(taskSourceWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *taskSourceAttribute = @{NSFontAttributeName: _taskSourceLabel.font};
    CGSize taskSourcesize = [_taskSourceLabel.text boundingRectWithSize:taskSourceBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:taskSourceAttribute context:nil].size;
    [_taskSourceView addSubview:_taskSourceLabel];
    _taskSourceView.frame = CGRectMake(10, CGRectGetMaxY(_taskOfficeView.frame)+10, self.view.width-20, taskSourcesize.height+30);
    _taskSourceLabel.frame = CGRectMake(20, 20, taskSourceWidth, taskSourcesize.height);
    [_mainContentScroll addSubview:_taskSourceView];
    
    /**
     * 计划完成时间
     */
    _completeTimeView = [[UIView alloc]init];
    _completeTimeView.backgroundColor = WXCColor(230, 255, 230);
    [_completeTimeView.layer setCornerRadius:10.0];
    _completeTimeLabel = [[UILabel alloc]init];
    _completeTimeLabel.font = ContentShowFont;
    _completeTimeLabel.text = [NSString stringWithFormat:@"计划完成时间：%@",self.taskTodoInfo.completeTime];
    [_completeTimeLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _completeTimeLabel.numberOfLines = 0;
    CGFloat completeTimeWidth = self.view.width-50;
    CGSize completeTimeBaseSize = CGSizeMake(completeTimeWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *completeTimeAttribute = @{NSFontAttributeName: _completeTimeLabel.font};
    CGSize completeTimesize = [_completeTimeLabel.text boundingRectWithSize:completeTimeBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:completeTimeAttribute context:nil].size;
    [_completeTimeView addSubview:_completeTimeLabel];
    _completeTimeView.frame = CGRectMake(10, CGRectGetMaxY(_taskSourceView.frame)+10, self.view.width-20, completeTimesize.height+30);
    _completeTimeLabel.frame = CGRectMake(20, 20, completeTimeWidth, completeTimesize.height);
    [_mainContentScroll addSubview:_completeTimeView];
    
    /**
     * 实际完成时间
     */
    _createTimeView = [[UIView alloc]init];
    _createTimeView.backgroundColor = WXCColor(230, 255, 230);
    [_createTimeView.layer setCornerRadius:10.0];
    _createTimeLabel = [[UILabel alloc]init];
    _createTimeLabel.font = ContentShowFont;
    _createTimeLabel.text = [NSString stringWithFormat:@"实际完成时间：%@",self.taskTodoInfo.createTime];
    [_createTimeLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _createTimeLabel.numberOfLines = 0;
    CGFloat createTimeWidth = self.view.width-50;
    CGSize createTimeBaseSize = CGSizeMake(createTimeWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *createTimeAttribute = @{NSFontAttributeName: _createTimeLabel.font};
    CGSize createTimesize = [_createTimeLabel.text boundingRectWithSize:createTimeBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:createTimeAttribute context:nil].size;
    [_createTimeView addSubview:_createTimeLabel];
    _createTimeView.frame = CGRectMake(10, CGRectGetMaxY(_completeTimeView.frame)+10, self.view.width-20, createTimesize.height+30);
    _createTimeLabel.frame = CGRectMake(20, 20, createTimeWidth, createTimesize.height);
    [_mainContentScroll addSubview:_createTimeView];
    
    /**
     * 进展情况
     */
    _progressView = [[UIView alloc]init];
    _progressView.backgroundColor = WXCColor(230, 255, 230);
    [_progressView.layer setCornerRadius:10.0];
    _progressLabel = [[UILabel alloc]init];
    _progressLabel.font = ContentShowFont;
    _progressLabel.text = [NSString stringWithFormat:@"进展情况：%@",self.taskTodoInfo.progress];
    [_progressLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _progressLabel.numberOfLines = 0;
    CGFloat progressWidth = self.view.width-50;
    CGSize progressBaseSize = CGSizeMake(progressWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *progressAttribute = @{NSFontAttributeName: _progressLabel.font};
    CGSize progresssize = [_progressLabel.text boundingRectWithSize:progressBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:progressAttribute context:nil].size;
    [_progressView addSubview:_progressLabel];
    _progressView.frame = CGRectMake(10, CGRectGetMaxY(_createTimeView.frame)+10, self.view.width-20, progresssize.height+30);
    _progressLabel.frame = CGRectMake(20, 20, progressWidth, progresssize.height);
    [_mainContentScroll addSubview:_progressView];
    
    /**
     * 督办秘书
     */
    _secretaryView = [[UIView alloc]init];
    _secretaryView.backgroundColor = WXCColor(230, 255, 230);
    [_secretaryView.layer setCornerRadius:10.0];
    _secretaryLabel = [[UILabel alloc]init];
    _secretaryLabel.font = ContentShowFont;
    _secretaryLabel.text = [NSString stringWithFormat:@"督办秘书：%@",self.taskTodoInfo.secretary];
    [_secretaryLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _secretaryLabel.numberOfLines = 0;
    CGFloat secretaryWidth = self.view.width-50;
    CGSize secretaryBaseSize = CGSizeMake(secretaryWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *secretaryAttribute = @{NSFontAttributeName: _secretaryLabel.font};
    CGSize secretarysize = [_secretaryLabel.text boundingRectWithSize:secretaryBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:secretaryAttribute context:nil].size;
    [_secretaryView addSubview:_secretaryLabel];
    _secretaryView.frame = CGRectMake(10, CGRectGetMaxY(_progressView.frame)+10, self.view.width-20, secretarysize.height+30);
    _secretaryLabel.frame = CGRectMake(20, 20, secretaryWidth, secretarysize.height);
    [_mainContentScroll addSubview:_secretaryView];
    
    /**
     * 回退历史
     */
    _backHistoryView = [[UIView alloc]init];
    _backHistoryView.backgroundColor = WXCColor(230, 255, 230);
    [_backHistoryView.layer setCornerRadius:10.0];
    _backHistoryLabel = [[UILabel alloc]init];
    _backHistoryLabel.font = ContentShowFont;
    _backHistoryLabel.text = [NSString stringWithFormat:@"回退历史：%@",self.taskTodoInfo.backHistory];
    [_backHistoryLabel setLineBreakMode:NSLineBreakByWordWrapping];
    _backHistoryLabel.numberOfLines = 0;
    CGFloat backHistoryWidth = self.view.width-50;
    CGSize backHistoryBaseSize = CGSizeMake(backHistoryWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *backHistoryAttribute = @{NSFontAttributeName: _backHistoryLabel.font};
    CGSize backHistorysize = [_backHistoryLabel.text boundingRectWithSize:backHistoryBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:backHistoryAttribute context:nil].size;
    [_backHistoryView addSubview:_backHistoryLabel];
    _backHistoryView.frame = CGRectMake(10, CGRectGetMaxY(_secretaryView.frame)+10, self.view.width-20, backHistorysize.height+30);
    _backHistoryLabel.frame = CGRectMake(20, 20, backHistoryWidth, backHistorysize.height);
    [_mainContentScroll addSubview:_backHistoryView];
    
    _mainContentScroll.contentSize = CGSizeMake(self.view.width, CGRectGetMaxY(_backHistoryView.frame) + (self.view.height - _backHistoryView.height)- 74);
}

-(void) setTwoUIFrame :(UIView*) view :(UIView*) previousView :(UILabel*) label :(NSString*) tittle :(NSString*) info :(UIView*) rightview :(UILabel*) rightlabel :(NSString*) righttittle :(NSString*) rightinfo{
    view = [[UIView alloc]init];
    view.backgroundColor = WXCColor(230, 255, 230);
    [view.layer setCornerRadius:10.0];
    label = [[UILabel alloc]init];
    label.font = ContentShowFont;
    label.text = [NSString stringWithFormat:@"%@：%@",tittle,info];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    label.numberOfLines = 0;
    CGFloat departmentx = 20;
    CGFloat departmenty = 20;
    CGFloat departmentWidth = (self.view.width-50)/2-5;
    CGSize departmentBaseSize = CGSizeMake(departmentWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *departmentAttribute = @{NSFontAttributeName: label.font};
    CGSize departmentsize = [label.text boundingRectWithSize:departmentBaseSize options:NSStringDrawingUsesLineFragmentOrigin attributes:departmentAttribute context:nil].size;
    [view addSubview:label];
    view.frame = CGRectMake(10, CGRectGetMaxY(previousView.frame)+10, (self.view.width-20)/2-5, departmentsize.height+30);
    label.frame = CGRectMake(departmentx, departmenty, departmentWidth, departmentsize.height);
    [_mainContentScroll addSubview:view];
    
    rightview = [[UIView alloc]init];
    rightview.backgroundColor = WXCColor(230, 255, 230);
    [rightview.layer setCornerRadius:10.0];
    rightlabel = [[UILabel alloc]init];
    rightlabel.font = ContentShowFont;
    rightlabel.text = [NSString stringWithFormat:@"%@：%@",righttittle,rightinfo];
    [rightlabel setLineBreakMode:NSLineBreakByWordWrapping];
    rightlabel.numberOfLines = 0;
    
    CGFloat officeLeaderx = 20;
    CGFloat officeLeadery = 20;
    
    [rightview addSubview:rightlabel];
    rightview.frame = CGRectMake(CGRectGetMaxX(view.frame)+5, view.y, view.width, view.height);
    rightlabel.frame = CGRectMake(officeLeaderx, officeLeadery,  departmentWidth, departmentsize.height);
    [_mainContentScroll addSubview:rightview];
    
}

@end
