//
//  WorkFlow.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/24.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "WorkFlow.h"

@interface WorkFlow ()
@property (weak, nonatomic) IBOutlet UIScrollView *workflowScrollView;

@end

@implementation WorkFlow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.workflowScrollView.contentSize = CGSizeMake(0, 480*2);
    [self addWorkFlow];
}

-(void)addWorkFlow{
    
}

@end
