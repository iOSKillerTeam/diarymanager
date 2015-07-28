//
//  BSPlanViewController.h
//  diarymanage
//
//  Created by 吴新超 on 15/6/16.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSPlanViewController : UIViewController
/** 要查询的领导按钮范围 */
@property (nonatomic, assign) CGRect leaderBtnViewF;
/** 选择的领导按钮范围 */
@property (nonatomic, assign) CGRect chooseBtnViewF;
/** 中间分隔的view的尺寸*/
@property (nonatomic, assign) CGRect clipView;

/** 整个下拉页面的view */
@property (nonatomic, strong) UIView *contentView;
/** 最上面的标题view */
@property (nonatomic, strong) UIView *tittleView;
/** 被选中的领导的view */
@property (nonatomic, strong) UIView *upView;
/** 选择区域的领导的view */
@property (nonatomic, strong) UIView *downView;
/** 中间分隔的view*/
@property (nonatomic, strong) UIView *middleView;
@end
