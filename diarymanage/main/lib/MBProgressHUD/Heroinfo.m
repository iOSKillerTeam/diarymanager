//
//  heroinfo.m
//  lolinfo
//
//  Created by 吴新超 on 15/4/12.
//  Copyright (c) 2015年 magina. All rights reserved.
//

#import "Heroinfo.h"

@implementation Heroinfo
-(id)initWithDict:(NSDictionary*) dict{
    if(self = [super init] ){
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
        self.desc = dict[@"desc"];
    }
    return self;
}
+(id)heroinfoWithDict:(NSDictionary *)dict{
    return [[Heroinfo alloc] initWithDict:dict];
}
-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"NAME"];
    [aCoder encodeObject:self.icon forKey:@"ICON"];
    [aCoder encodeObject:self.desc forKey:@"DESC"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    self.name = [aDecoder decodeObjectForKey:@"NAME"];
    self.icon = [aDecoder decodeObjectForKey:@"ICON"];
    self.desc = [aDecoder decodeObjectForKey:@"DESC"];
    return self;
}
@end
