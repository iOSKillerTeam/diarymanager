//
//  heroinfo.h
//  lolinfo
//
//  Created by 吴新超 on 15/4/12.
//  Copyright (c) 2015年 magina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Heroinfo : NSObject<NSCoding>
@property(strong,nonatomic) NSString* icon;
@property(strong,nonatomic) NSString* name;
@property(strong,nonatomic) NSString* desc;
-(id)initWithDict:(NSDictionary*) dict;
+(id)heroinfoWithDict:(NSDictionary*)dict;
@end
