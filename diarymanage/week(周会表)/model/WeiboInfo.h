//
//  WeiboInfo.h
//  codeforcell
//
//  Created by 吴新超 on 15/4/1.
//  Copyright (c) 2015年 magina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboInfo : NSObject
@property(strong,nonatomic) NSString* icon;
@property(strong,nonatomic) NSString* name;
@property(assign,nonatomic) NSString* startTime;
@property(strong,nonatomic) NSString* endTime;
@property(strong,nonatomic) NSString* editTime;
@property(strong,nonatomic) NSString* content;
@property(strong,nonatomic) NSString* joinPeople;
@property(strong,nonatomic) NSString* other;
@property(strong,nonatomic) NSString* editPeople;
-(id)initWithDictionary:(NSDictionary*) dictionary;
+(id)weiboInfoWithDictionary:(NSDictionary*) dictionary;
@end
