//
//  WeiboInfo.m
//  codeforcell
//
//  Created by 吴新超 on 15/4/1.
//  Copyright (c) 2015年 magina. All rights reserved.
//

#import "WeiboInfo.h"

@implementation WeiboInfo
-(id)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init] ){
        self.icon = dictionary[@"icon"];
        self.name = dictionary[@"name"];
        self.content = dictionary[@"content"];
        self.startTime = dictionary[@"startTime"];
        self.endTime = dictionary[@"endTime"];
        self.editTime = dictionary[@"editTime"];
        self.editPeople = dictionary[@"editPeople"];
        self.joinPeople = dictionary[@"joinPeople"];
        self.other = dictionary[@"other"];
    }
    return self;
}
+(id)weiboInfoWithDictionary:(NSDictionary *)dictionary{
    return [[WeiboInfo alloc] initWithDictionary:dictionary];
}
@end
