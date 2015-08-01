//
//  BSWorkFlowInfo.h
//  diarymanage
//
//  Created by wosinC on 15/8/1.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BSWorkFlowInfo : NSObject
@property(strong,nonatomic) NSString* t_id;
@property(strong,nonatomic) NSString* taskname;
@property(strong,nonatomic) NSString* ropera_step;
@property(strong,nonatomic) NSString* opera_time;
@property(strong,nonatomic) NSString* opera_per;
@property(strong,nonatomic) NSString* next_opera_per;
-(id)initWithDict:(NSDictionary*) dict;
+(id)bSWorkFlowInfoWithDict:(NSDictionary*) dict;

@end
