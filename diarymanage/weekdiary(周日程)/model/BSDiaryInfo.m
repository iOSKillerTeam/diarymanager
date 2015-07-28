//
//  BSDiaryInfo.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/19.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSDiaryInfo.h"

@implementation BSDiaryInfo
-(id)initWithDict:(NSDictionary*) dict{
    if(self = [super init] ){
        self.weeked = dict[@"weeked"];
        self.name = dict[@"name"];
        self.content = dict[@"content"];
        self.time = dict[@"time"];
        self.meetingRoom = dict[@"meetingRoom"];
    }
    return self;
}
+(id)bSDiaryInfoWithDict:(NSDictionary *)dict{
    return [[BSDiaryInfo alloc] initWithDict:dict];
}
@end
