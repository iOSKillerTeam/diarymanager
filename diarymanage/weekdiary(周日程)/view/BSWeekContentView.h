//
//  BSWeekContentView.h
//  diarymanage
//
//  Created by wosinC on 15/8/13.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSDiaryInfo;
@interface BSWeekContentView : UIView
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *meetingRoom;
@property (strong,nonatomic) BSDiaryInfo *bSDiaryInfo;
+(id)bSWeekDiaryCell;
@end
