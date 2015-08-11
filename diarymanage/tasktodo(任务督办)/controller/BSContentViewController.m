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
@end

@implementation BSContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WXCColor(60, 255, 150);
    _leftMenuScroll = [[UIScrollView alloc]init];
    _leftMenuScroll.scrollEnabled = YES;
    _leftMenuScroll.frame = CGRectMake(self.view.width-self.view.width/3, 0, self.view.width/3,self.view.height);
    
    [self.view addSubview:_leftMenuScroll];
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 0, _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn.backgroundColor = [UIColor yellowColor];
    [_leftMenuScroll addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]init];
    btn2.frame = CGRectMake(0, CGRectGetMaxY(btn.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn2.backgroundColor = [UIColor blueColor];
    [_leftMenuScroll addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]init];
    btn3.frame = CGRectMake(0, CGRectGetMaxY(btn2.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn3.backgroundColor = [UIColor grayColor];
    [_leftMenuScroll addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc]init];
    btn4.frame = CGRectMake(0, CGRectGetMaxY(btn3.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn4.backgroundColor = [UIColor orangeColor];
    [_leftMenuScroll addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]init];
    btn5.frame = CGRectMake(0, CGRectGetMaxY(btn4.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn5.backgroundColor = [UIColor redColor];
    [_leftMenuScroll addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc]init];
    btn6.frame = CGRectMake(0, CGRectGetMaxY(btn5.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn6.backgroundColor = [UIColor greenColor];
    [_leftMenuScroll addSubview:btn6];
    
    UIButton *btn7 = [[UIButton alloc]init];
    btn7.frame = CGRectMake(0, CGRectGetMaxY(btn6.frame), _leftMenuScroll.width, _leftMenuScroll.height/6);
    btn7.backgroundColor = [UIColor purpleColor];
    [_leftMenuScroll addSubview:btn7];
    
    _leftMenuScroll.contentSize = CGSizeMake(self.view.width/3, CGRectGetMaxY(btn7.frame));
    
    // Do any additional setup after loading the view from its nib.
    //    ZIOMenuView *moveView = [ZIOMenuView menuViewWithLeftViewWidth:130 andRightWidth:100];
    ZIOMenuView *moveView = [[ZIOMenuView alloc] init];
    //设置颜色 （默认白色背景）
    moveView.backgroundColor = WXCColor(140, 255, 150);
    
    /**
     * 主要内容的scrollview容器
     */
    _mainContentScroll = [[UIScrollView alloc]init];
    _mainContentScroll.scrollEnabled = YES;
    _mainContentScroll.frame = CGRectMake(0, 0, self.view.width,self.view.height);
    
    /**
     * 任务事项
     */
    UIView * tittleView = [[UIView alloc]init];
    tittleView.backgroundColor = WXCColor(230, 255, 230);
    [tittleView.layer setCornerRadius:10.0];
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
    [tittleView addSubview:_taskTittleLabel];
    tittleView.frame = CGRectMake(10, 74, self.view.width-20, contentsize.height+30);
     _taskTittleLabel.frame = CGRectMake(contentx, contenty, contentWidth, contentsize.height);
    [_mainContentScroll addSubview:tittleView];
    
    /**
     * 任务说明
     */
    UIView * taskContentView = [[UIView alloc]init];
    taskContentView.backgroundColor = WXCColor(230, 255, 230);
    [taskContentView.layer setCornerRadius:10.0];
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
    [taskContentView addSubview:_taskContentLabel];
    taskContentView.frame = CGRectMake(10, CGRectGetMaxY(tittleView.frame)+10, self.view.width-20, taskContentsize.height+30);
    _taskContentLabel.frame = CGRectMake(taskContentx, taskContenty, taskContentWidth, taskContentsize.height);
    [_mainContentScroll addSubview:taskContentView];
    
    /**
     * 完成情况说明
     */
    UIView * taskCompletionView = [[UIView alloc]init];
    taskCompletionView.backgroundColor = WXCColor(230, 255, 230);
    [taskCompletionView.layer setCornerRadius:10.0];
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
    [taskCompletionView addSubview:_taskCompletionLabel];
    taskCompletionView.frame = CGRectMake(10, CGRectGetMaxY(taskContentView.frame)+10, self.view.width-20, taskCompletionsize.height+30);
    _taskCompletionLabel.frame = CGRectMake(taskCompletionx, taskCompletiony, taskCompletionxWidth, taskCompletionsize.height);
    [_mainContentScroll addSubview:taskCompletionView];
    
    _mainContentScroll.contentSize = CGSizeMake(self.view.width, CGRectGetMaxY(taskCompletionView.frame)+10);
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

@end
