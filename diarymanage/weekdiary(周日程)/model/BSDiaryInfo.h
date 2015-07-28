//
//  BSDiaryInfo.h
//  diarymanage
//
//  Created by 吴新超 on 15/6/19.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSDiaryInfo : NSObject
@property(strong,nonatomic) NSString* weeked;
@property(strong,nonatomic) NSString* name;
@property(strong,nonatomic) NSString* content;
@property(strong,nonatomic) NSString* time;
@property(strong,nonatomic) NSString* meetingRoom;
-(id)initWithDict:(NSDictionary*) dict;
+(id)bSDiaryInfoWithDict:(NSDictionary*)dict;
@end
