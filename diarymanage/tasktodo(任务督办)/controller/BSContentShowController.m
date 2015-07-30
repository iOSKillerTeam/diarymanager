//
//  BSContentShowController.m
//  diarymanage
//
//  Created by wosinC on 15/7/30.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSContentShowController.h"

@interface BSContentShowController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentShowScroll;

@end

@implementation BSContentShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentShowScroll.showsHorizontalScrollIndicator = NO;
    self.contentShowScroll.showsVerticalScrollIndicator = NO;
    
    self.contentShowScroll.contentSize = CGSizeMake(0, 320*3);
}

@end
