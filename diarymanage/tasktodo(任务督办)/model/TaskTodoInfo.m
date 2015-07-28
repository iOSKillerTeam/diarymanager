//
//  TaskTodoInfo.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/23.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "TaskTodoInfo.h"

@implementation TaskTodoInfo
-(id)initWithDict:(NSDictionary*) dict{
    if(self = [super init] ){
        
        self.taskTittle = dict[@"taskTittle"];
        self.head = dict[@"head"];
        self.createTime = dict[@"createTime"];
        
    }
    return self;
}
+(id)taskTodoInfoWithDict:(NSDictionary *)dict{
    return [[TaskTodoInfo alloc] initWithDict:dict];
}
@end
