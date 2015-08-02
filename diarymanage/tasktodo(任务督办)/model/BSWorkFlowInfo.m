//
//  BSWorkFlowInfo.m
//  diarymanage
//
//  Created by wosinC on 15/8/1.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSWorkFlowInfo.h"

@implementation BSWorkFlowInfo
-(id)initWithDict:(NSDictionary*) dict{
    if(self = [super init] ){
        
        self.t_id = dict[@"t_id"];
        self.taskname = dict[@"taskname"];
        self.ropera_step = dict[@"ropera_step"];
        self.opera_time = dict[@"opera_time"];
        self.opera_per = dict[@"opera_per"];
        self.next_opera_per = dict[@"next_opera_per"];
        //一天的工作开始
        
    }
    return self;
}
+(id)bSWorkFlowInfoWithDict:(NSDictionary *)dict{
    return [[BSWorkFlowInfo alloc] initWithDict:dict];
}
@end
