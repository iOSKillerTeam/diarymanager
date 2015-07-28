//
//  TaskTodoInfo.h
//  diarymanage
//
//  Created by 吴新超 on 15/6/23.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskTodoInfo : NSObject
@property(strong,nonatomic) NSString *taskTittle;
@property(strong,nonatomic) NSString *head;
@property(strong,nonatomic) NSString *assignPeople;
@property(strong,nonatomic) NSString *createTime;
@property(strong,nonatomic) NSString *taskSource;
@property(strong,nonatomic) NSString *completeTime;
@property(strong,nonatomic) NSString *department;
@property(strong,nonatomic) NSString *progress;
@property(strong,nonatomic) NSString *taskOffice;
@property(strong,nonatomic) NSString *taskRecord;
@property(strong,nonatomic) NSString *taskUndertake;
@property(strong,nonatomic) NSString *secretary;
@property(strong,nonatomic) NSString *taskContent;
@property(strong,nonatomic) NSString *taskCompletion;
@property(strong,nonatomic) NSString *backHistory;
-(id)initWithDict:(NSDictionary*) dict;
+(id)taskTodoInfoWithDict:(NSDictionary*)dict;
@end
