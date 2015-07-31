//
//  BSContentShowController.m
//  diarymanage
//
//  Created by wosinC on 15/7/31.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSContentShowController.h"

@interface BSContentShowController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentShowScrollView;

@end

@implementation BSContentShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentShowScrollView.showsHorizontalScrollIndicator = NO;
    self.contentShowScrollView.showsVerticalScrollIndicator = NO;
    self.contentShowScrollView.contentSize = CGSizeMake(0, 480*3);
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
