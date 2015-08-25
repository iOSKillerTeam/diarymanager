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
#import "SecurityUtil.h"
#import "MJRefresh.h"
#define WXCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface BSWeekViewController()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *MeetingContentView;
@property (strong,nonatomic) UITableView *tableVieweeting;
@property (weak, nonatomic) IBOutlet UIScrollView *smallScrollView;
@property (strong,nonatomic) NSString* tittleName;
@property (strong,nonatomic) NSString* btnTag;
@end

@implementation BSWeekViewController{
    float rowHeight;//用来取每行动态的行高
    NSMutableArray* muarray;
    int pageNum;
}
-(void)viewDidLoad{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.showsVerticalScrollIndicator = NO;
    [self.tableVieweeting addFooterWithTarget:self action:@selector(loadMoreWeekInfo)];
    [self.tableVieweeting addHeaderWithTarget:self action:@selector(roadWeekInfo)];
    [self roadWeekInfo];
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
//    footView.backgroundColor = [UIColor greenColor];
//    return footView;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 50;
//}

-(void)loadMoreWeekInfo{
    pageNum+=1;
    //1,创建请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //发送请求参数并加密
    params[@"starttime"] = __BASE64([NSString stringWithFormat:@"2014-2-5"]);
    params[@"endtime"] = __BASE64([NSString stringWithFormat:@"2014-12-1"]);
    params[@"nameid"] = __BASE64([NSString stringWithFormat:@"wgang"]);
    NSString *page = [NSString stringWithFormat:@"%d",pageNum];
    NSLog(@"-----%@-----",page);
    params[@"pageNum"] = __BASE64(page);
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
        
        NSMutableArray *moreweekinfos = [[NSMutableArray alloc] initWithCapacity:20];
        for(int i=0;i<array.count;i++){
            WeiboInfo* weibo = [[WeiboInfo alloc]initWithDictionary:array[i]];
            [moreweekinfos addObject:weibo];
        }
        [muarray addObjectsFromArray:moreweekinfos];
        // 刷新表格
        [_tableVieweeting reloadData];

        // 结束刷新(隐藏footer)
        self.tableVieweeting.tableFooterView.hidden = YES;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)roadWeekInfo{
    //1,创建请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //发送请求参数并加密
    params[@"starttime"] = __BASE64([NSString stringWithFormat:@"2014-2-5"]);
    params[@"endtime"] = __BASE64([NSString stringWithFormat:@"2014-12-1"]);
    params[@"nameid"] = __BASE64([NSString stringWithFormat:@"wgang"]);
    pageNum = 1;
    NSString *page = [NSString stringWithFormat:@"%d",pageNum];
    NSLog(@"+++%@+++",page);
    params[@"pageNum"] = __BASE64(page);
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
