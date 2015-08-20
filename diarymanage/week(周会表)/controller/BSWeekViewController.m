//
//  BSWeekViewController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/16.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSWeekViewController.h"
#import "BSMeetingTableViewController.h"
#import "SXTitleLable.h"
#import "UIView+Extension.h"
#import "WeiboCell.h"
#import "WeiboInfo.h"
#import "AFNetworking.h"
#import "GTMBase64.h"
#define WXCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface BSWeekViewController()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *MeetingContentView;
@property (strong,nonatomic) UITableView *tableVieweeting;
@property (weak, nonatomic) IBOutlet UIScrollView *smallScrollView;
//@property (weak, nonatomic) IBOutlet UIView *AdministrationConference;
//@property (weak, nonatomic) IBOutlet UIView *specialWork;
//@property (weak, nonatomic) IBOutlet UIView *partyMeeting;
//@property (weak, nonatomic) IBOutlet UIView *productMeeting;
@property (strong,nonatomic) NSString* tittleName;
@property (strong,nonatomic) NSString* btnTag;
@end

@implementation BSWeekViewController{
    float rowHeight;//用来取每行动态的行高
    NSMutableArray* muarray;
}
-(void)viewDidLoad{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.showsVerticalScrollIndicator = NO;

    //1,创建请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //发送请求参数并加密
    params[@"starttime"] = __BASE64([NSString stringWithFormat:@"2014-2-5"]);
    params[@"endtime"] = __BASE64([NSString stringWithFormat:@"2014-12-1"]);
    params[@"nameid"] = __BASE64([NSString stringWithFormat:@"wgang"]);
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:1];
    //发送请求
    [manager GET:@"http://61.164.205.27:8880/Schedule/zact_WebService_tncnpZycList.html" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //返回数据成功后解密
        NSDictionary *dict = [[NSDictionary alloc] init];
        NSLog(@"----%lu",(unsigned long)[responseObject count]);
        for (int i=0 ;i<[responseObject count] ;i++) {
            NSString *name = __TEXT(responseObject[i][@"user_name"]);
            NSString *startTime = __TEXT(responseObject[i][@"starttime"]);
            NSString *endTime = __TEXT(responseObject[i][@"endtime"]);
            NSString *editTime = __TEXT(responseObject[i][@"optime"]);
            NSString *content = __TEXT(responseObject[i][@"title"]);
            NSString *joinPeople = __TEXT(responseObject[i][@"content"]);
            NSString *editPeople = __TEXT(responseObject[i][@"opuser"]);
            NSString *other = __TEXT(responseObject[i][@"note"]);
            
            dict = @{@"icon":@"icon.png",@"name":name,@"startTime":startTime,@"endTime":endTime,@"editTime":editTime,@"content":content,@"joinPeople":joinPeople,@"editPeople":editPeople,@"other":other};
            [array addObject:dict];
        }
        
        muarray = [[NSMutableArray alloc] initWithCapacity:20];
        for(int i=0;i<array.count;i++){
            WeiboInfo* weibo = [[WeiboInfo alloc]initWithDictionary:array[i]];
            [muarray addObject:weibo];
        }
        [self initTableViewMeeting];
        [self addLable];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

    
//    NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"李志勇",@"startTime":@"2015年6月23日 09:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"职业技能鉴定国家题库（核工业分库）阶段性审查会",@"joinPeople":@"人力资源处，集团公司人力资源部级职业技能鉴定指导中心，题库建设专家组成员等",@"editPeople":@"李四",@"other":@"请大家准备好命题"},@{@"icon":@"icon.png",@"name":@"核安全局",@"startTime":@"2015年6月23日 13:30:00",@"endTime":@"2015年6月23日 15:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"秦三厂112大修核安全局临界检查后会议",@"joinPeople":@"方家山执照管理处邮件通知为主",@"editPeople":@"王五",@"other":@"请带好纸笔，会议期间不得接听电话"},@{@"icon":@"icon.png",@"name":@"张建成",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王奇文",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
    

}
-(void)initTableViewMeeting{
    _tableVieweeting = [[UITableView alloc]init];
    _tableVieweeting.delegate = self;
    _tableVieweeting.dataSource = self;
    _tableVieweeting.backgroundColor = WXCColor(211, 211, 211);
    _tableVieweeting.allowsSelection = NO;//将CELL设置成不可选中
    _tableVieweeting.frame = CGRectMake(0, 0, self.view.width, self.view.height-_MeetingContentView.y);
//    NSLog(@"-----%f",_MeetingContentView.height);
    [_MeetingContentView addSubview:_tableVieweeting];
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




/** 添加标题栏 */
- (void)addLable
{
    for (int i = 1; i < 8; i++) {
        CGFloat lblW = 70;
        CGFloat lblH = 30;
        CGFloat lblY = 0;
        CGFloat lblX = (i-1) * lblW;
        SXTitleLable *lbl1 = [[SXTitleLable alloc]init];
        //UIViewController *vc = self.childViewControllers[i];
        //lbl1.text =vc.title;
        if(i == 1){
            lbl1.text =@"星期一";
        }else if(i == 2){
            lbl1.text =@"星期二";
        }else if(i == 3){
            lbl1.text =@"星期三";
        }else if(i == 4){
            lbl1.text =@"星期四";
        }else if(i == 5){
            lbl1.text =@"星期五";
        }else if(i == 6){
            lbl1.text =@"星期六";
        }else if(i == 7){
            lbl1.text =@"星期天";
        }
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        [self.smallScrollView addSubview:lbl1];
        lbl1.tag = i;
        lbl1.textColor = [UIColor whiteColor];
        lbl1.userInteractionEnabled = YES;
        
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    self.smallScrollView.contentSize = CGSizeMake(70 * 7, 0);
    
}


/** 标题栏label的点击事件 */
- (void)lblClick:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"自己进来了");
    if(_btnTag != nil){
        int tag = [_btnTag integerValue];
        SXTitleLable *oldTitlelable = (SXTitleLable*)[self.smallScrollView viewWithTag:tag];
        oldTitlelable.textColor = [UIColor whiteColor];
        oldTitlelable.font = [UIFont systemFontOfSize:16];
    }
    
    SXTitleLable *titlelable = (SXTitleLable *)recognizer.view;
    titlelable.textColor = [UIColor redColor];
    titlelable.font = [UIFont systemFontOfSize:24];
    _btnTag = [NSString stringWithFormat:@"%ld",(long)titlelable.tag];
}



@end
