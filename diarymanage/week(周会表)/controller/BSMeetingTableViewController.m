//
//  BSMeetingTableViewController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/17.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSMeetingTableViewController.h"
#import "WeiboCell.h"
#import "WeiboInfo.h"
#define WXCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface BSMeetingTableViewController ()

@end

@implementation BSMeetingTableViewController
{
    float rowHeight;//用来取每行动态的行高
    NSMutableArray* muarray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.title;
    self.tableView.backgroundColor = WXCColor(211, 211, 211);
    NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"李志勇",@"startTime":@"2015年6月23日 09:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"职业技能鉴定国家题库（核工业分库）阶段性审查会",@"joinPeople":@"人力资源处，集团公司人力资源部级职业技能鉴定指导中心，题库建设专家组成员等",@"editPeople":@"李四",@"other":@"请大家准备好命题"},@{@"icon":@"icon.png",@"name":@"核安全局",@"startTime":@"2015年6月23日 13:30:00",@"endTime":@"2015年6月23日 15:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"秦三厂112大修核安全局临界检查后会议",@"joinPeople":@"方家山执照管理处邮件通知为主",@"editPeople":@"王五",@"other":@"请带好纸笔，会议期间不得接听电话"},@{@"icon":@"icon.png",@"name":@"张建成",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王奇文",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
    muarray = [[NSMutableArray alloc] initWithCapacity:20];
    for(int i=0;i<array.count;i++){
        WeiboInfo* weibo = [[WeiboInfo alloc]initWithDictionary:array[i]];
        [muarray addObject:weibo];
    }

    self.tableView.allowsSelection = NO;//将CELL设置成不可选中
    //_tableview.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉每行cell的分割线
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* CellIdentifier = @"Cell";
    //1,从缓存池中取出可利用的cell
    WeiboCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //2，如果缓存池中没有（第一次进入）那么就创建出这几个Cell
    if(cell == nil){
        //创建Cell时给每个Cell添加一个reuseIdentifier，便于下次从缓存池中找到我们要用的cell去创建
        cell = [[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault         reuseIdentifier:CellIdentifier];
    }
    cell.weiboInfo = muarray[indexPath.row];
    rowHeight = cell.cellHeight;//cell中得rowHeight已经保存了最后所得得行高
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"rows = %lu",(unsigned long)muarray.count);
    return muarray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"行高-----%f",rowHeight);
    return rowHeight;
}

@end
