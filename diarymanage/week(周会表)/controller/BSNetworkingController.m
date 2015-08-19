//
//  BSNetworkingController.m
//  diarymanage
//
//  Created by 祝杰克 on 15/8/19.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSNetworkingController.h"
#import "AFNetworking.h"

@interface BSNetworkingController ()

@end

@implementation BSNetworkingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self postOneWeekMeetings];
}

// 获取一周会表数据
- (void)postOneWeekMeetings
{
    NSString *urlStr = @"http://192.168.80.56:8080/Schedule/zact_WebService_tncnp01List";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
