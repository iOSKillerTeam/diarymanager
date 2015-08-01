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
        
        self.t_id = dict[@"t_id"];
        self.taskTittle = dict[@"taskTittle"];
        self.head = dict[@"head"];
        self.taskSource = dict[@"taskSource"];
        self.assignPeople = dict[@"assignPeople"];
        self.completeTime = dict[@"completeTime"];
        
        self.officeLeader = dict[@"officeLeader"];
        self.responsePeople = dict[@"responsePeople"];
        self.createTime = dict[@"createTime"];
        self.department = dict[@"department"];
        self.progress = dict[@"progress"];
        self.taskOffice = dict[@"taskOffice"];
        self.taskRecord = dict[@"taskRecord"];
        self.taskUndertake = dict[@"taskUndertake"];
        self.secretary = dict[@"secretary"];
        self.taskContent = dict[@"taskContent"];
        self.taskCompletion = dict[@"taskCompletion"];
        self.backHistory = dict[@"backHistory"];
        
    }
    return self;
}
+(id)taskTodoInfoWithDict:(NSDictionary *)dict{
    return [[TaskTodoInfo alloc] initWithDict:dict];
}
@end
