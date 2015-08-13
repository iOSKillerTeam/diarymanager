//
//  BSWeekContentView.m
//  diarymanage
//
//  Created by wosinC on 15/8/13.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSWeekContentView.h"
#import "BSDiaryInfo.h"
@implementation BSWeekContentView

+(id)bSWeekDiaryCell{
    return [[NSBundle mainBundle] loadNibNamed:@"TLDemoViewController" owner:nil options:nil][0];
}

-(void)setBSDiaryInfo:(BSDiaryInfo *)bSDiaryInfo{
    self.name.text = bSDiaryInfo.name;
    self.content.text = bSDiaryInfo.content;
    self.time.text = bSDiaryInfo.time;
    self.meetingRoom.text = bSDiaryInfo.meetingRoom;
}

@end
