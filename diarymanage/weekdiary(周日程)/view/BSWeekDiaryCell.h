//
//  BSWeekDiaryCell.h
//  diarymanage
//
//  Created by 吴新超 on 15/6/19.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSDiaryInfo;
@interface BSWeekDiaryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *weekedImageView;
@property (weak, nonatomic) IBOutlet UILabel *meetingRoomLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong,nonatomic) BSDiaryInfo *bSDiaryInfo;
+(id)bSWeekDiaryCell;
@end
