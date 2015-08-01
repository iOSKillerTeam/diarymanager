//
//  WorkFlow.h
//  diarymanage
//
//  Created by 吴新超 on 15/6/24.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSWorkFlowInfo;
@interface WorkFlow : UIViewController
@property(strong,nonatomic)NSString* task_id;
@property(strong,nonatomic) BSWorkFlowInfo* workFlowInfo;
@end
