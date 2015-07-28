//
//  BSTabBarController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/16.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSTabBarController.h"

@implementation BSTabBarController
-(void)viewDidLoad{
    [super viewDidLoad];
   
}

+(void)initialize{
    UITabBar* bar = [UITabBar appearance];
    
    CGRect frame = CGRectMake(0,200,320,48);
    
    UIView *v = [[UIView alloc]initWithFrame:frame];
    
    [v setBackgroundColor:[[UIColor alloc]initWithRed:70.0/255.0
                           
                                                green:65.0/255.0
                           
                                                 blue:62.0/255.0
                           
                                                alpha:1.0]];
    
    [bar insertSubview:v atIndex:0];
}

@end
