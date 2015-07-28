//
//  BSWeekDiaryCell.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/19.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSWeekDiaryCell.h"
#import "BSDiaryInfo.h"
@implementation BSWeekDiaryCell

+(id)bSWeekDiaryCell{
    return [[NSBundle mainBundle] loadNibNamed:@"BSWeekDiaryCell" owner:nil options:nil][0];
}

/**
 *  cell的初始化方法，一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件，以及子控件的一次性设置
 */

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return  self;
}

-(void)setBSDiaryInfo:(BSDiaryInfo *)bSDiaryInfo{
    if([bSDiaryInfo.weeked isEqual:@"星期一"]){
        _weekedImageView.image = [UIImage imageNamed:@"week1"];
    }else if ([bSDiaryInfo.weeked isEqualToString:@"星期二"]){
        _weekedImageView.image = [UIImage imageNamed:@"week2"];
    }else if ([bSDiaryInfo.weeked isEqualToString:@"星期三"]){
        _weekedImageView.image = [UIImage imageNamed:@"week3"];
    }else if ([bSDiaryInfo.weeked isEqualToString:@"星期四"]){
        _weekedImageView.image = [UIImage imageNamed:@"week4"];
    }else if ([bSDiaryInfo.weeked isEqualToString:@"星期五"]){
        _weekedImageView.image = [UIImage imageNamed:@"week5"];
    }
    
    _meetingRoomLabel.text = bSDiaryInfo.meetingRoom;
    _contentLabel.text = bSDiaryInfo.content;
    _timeLabel.text = bSDiaryInfo.time;
}


@end
