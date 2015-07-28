//
//  BSPlanViewController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/16.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSPlanViewController.h"
#import "CHTumblrMenuView.h"
#import "TeamFollowButton.h"
#import "UIView+Extension.h"
#import "WeiboInfo.h"
#import "WeiboCell.h"
#define WXCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 正文字体
#define HWStatusCellContentFont [UIFont systemFontOfSize:14]
//按钮宽度
#define leaderBtnWidth 60
//按钮高度
#define leaderBtnHeight 30
//按钮间距
#define leaderBtnMaginW 2
//按钮高度差
#define leaderBtnMaginH 4
@interface BSPlanViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet TeamFollowButton *transformBtnView;
// 定义变量记录当前按钮的状态
@property (nonatomic, assign, getter = isOpen) BOOL open;

@property(nonatomic,strong) NSMutableArray *upLeaderBtns;

@property(nonatomic,strong) NSMutableArray *downLeaderBtns;

@property(nonatomic,strong) NSArray *leaders;

@end
@implementation BSPlanViewController
{
    float rowHeight;//用来取每行动态的行高
    NSMutableArray* muarray;
}
-(void)viewDidLoad{
    _leaders = @[@"张涛",@"王奇文",@"吴炳泉",@"张建成",@"张海伦",@"张三",@"李四",@"王五",@"张三",@"伍吉泽",@"赵六",@"葛斌",@"王洪波",@"张智尧",@"李娜",@"刘翔",@"马云",@"王思聪",@"方家山",@"钱小六",@"张尼玛",@"姚翀",@"纵骋",@"郝斌",@"王力宏",@"王海波",@"赵钱孙",@"测试"];
    _downLeaderBtns = [NSMutableArray arrayWithArray:_leaders];
    /** 整个下拉页面的view */
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = WXCColor(248, 248, 248);
    self.contentView.frame = CGRectMake(0, -432, 320, 432);
    [self setupSubviews];
    [self.view addSubview:self.contentView];
    
     NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"李志勇",@"startTime":@"2015年6月23日 09:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"职业技能鉴定国家题库（核工业分库）阶段性审查会",@"joinPeople":@"人力资源处，集团公司人力资源部级职业技能鉴定指导中心，题库建设专家组成员等",@"editPeople":@"李四",@"other":@"请大家准备好命题"},@{@"icon":@"icon.png",@"name":@"核安全局",@"startTime":@"2015年6月23日 13:30:00",@"endTime":@"2015年6月23日 15:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"秦三厂112大修核安全局临界检查后会议",@"joinPeople":@"方家山执照管理处邮件通知为主",@"editPeople":@"王五",@"other":@"请带好纸笔，会议期间不得接听电话"},@{@"icon":@"icon.png",@"name":@"张建成",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王奇文",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
    
    [self initPlanView:array];
    
}
//初始化工作计划内容
-(void)initPlanView:(NSArray*)array{
    UITableView *planView = [[UITableView alloc]init];
    planView.frame = CGRectMake(0, 64, 320, 367);
    [self.view addSubview:planView];
    [self.view bringSubviewToFront:self.contentView];
    planView.delegate = self;
    planView.dataSource = self;
    planView.backgroundColor = WXCColor(211, 211, 211);
   
    muarray = [[NSMutableArray alloc] initWithCapacity:20];
    for(int i=0;i<array.count;i++){
        WeiboInfo* weibo = [[WeiboInfo alloc]initWithDictionary:array[i]];
        [muarray addObject:weibo];
    }
    
    planView.allowsSelection = NO;//将CELL设置成不可选中

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

/** 
 *最上面的标题view
 */
-(void)setupTittleView{
    self.tittleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 320, 30)];
    self.tittleView.backgroundColor = WXCColor(253, 253, 253);
    UILabel *tittleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 160, 30)];
    tittleLabel.text = @"查看以下领导的日程";
    tittleLabel.font = HWStatusCellContentFont;
    [self.tittleView addSubview:tittleLabel];
    UIButton *commitBtn = [[UIButton alloc]init];
    [commitBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    CGSize commitBtnSize = CGSizeMake(leaderBtnWidth,leaderBtnHeight);
    commitBtn.frame = (CGRect){{320-10-leaderBtnWidth, 0}, commitBtnSize};
    commitBtn.layer.cornerRadius = 14;
    [commitBtn.layer setMasksToBounds:YES];
    [commitBtn.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef commitBtncolorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef commitBtncolorref = CGColorCreate(commitBtncolorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [commitBtn.layer setBorderColor:commitBtncolorref];//边框颜色
    [commitBtn setTitle:@"完成" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitChooseBtn:)
        forControlEvents:UIControlEventTouchUpInside];
    commitBtn.titleLabel.font = HWStatusCellContentFont;
    commitBtn.backgroundColor = WXCColor(253,253,253);
    [self.tittleView addSubview:commitBtn];
    
    UIButton *selAllBtn = [[UIButton alloc]init];
    CGSize selAllBtnSize = CGSizeMake(leaderBtnWidth,leaderBtnHeight);
    selAllBtn.frame = (CGRect){{320-10-leaderBtnWidth-10-leaderBtnWidth, 0}, selAllBtnSize};
    selAllBtn.layer.cornerRadius = 14;
    [selAllBtn.layer setMasksToBounds:YES];
    [commitBtn.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef selAllBtncolorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef selAllBtncolorref = CGColorCreate(selAllBtncolorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [selAllBtn.layer setBorderColor:selAllBtncolorref];//边框颜色
    [selAllBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [selAllBtn setTitle:@"全选" forState:UIControlStateNormal];
    [selAllBtn addTarget:self action:@selector(selAllBtn:)
        forControlEvents:UIControlEventTouchUpInside];
    selAllBtn.titleLabel.font = HWStatusCellContentFont;
    selAllBtn.backgroundColor = WXCColor(253,253,253);
    [self.tittleView addSubview:selAllBtn];

}
-(void)selAllBtn:(UIButton*)btn{
    if(!_upLeaderBtns){
        self.upLeaderBtns = [NSMutableArray array];
    }
    if(!_downLeaderBtns){
        self.downLeaderBtns = [NSMutableArray array];
    }
    if(_downLeaderBtns.count == 0){
        [_downLeaderBtns addObjectsFromArray:_upLeaderBtns];
        [_upLeaderBtns removeAllObjects];
    }else{
        [_upLeaderBtns addObjectsFromArray:_downLeaderBtns];
        [_downLeaderBtns removeAllObjects];
    }
    
    
    [self setupSubviews];
}
-(void)commitChooseBtn:(UIButton*)btn{
    [UIView animateWithDuration:0.5 animations:^{
        // 1.旋转按钮上的尖尖
        self.transformBtnView.imageView.transform = CGAffineTransformIdentity;
    }];
    // 改变当前按钮的状态
    self.open = NO;
    
    //        // 隐藏内容View
    //        self.contentView.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        // 1.旋转按钮上的尖尖
        self.contentView.frame = CGRectMake(0, -432, 320, 200);
    }];
}
/**
 *设置各子控件的尺寸
 */
-(void)setupSubviews{
    if(self.contentView.subviews.count>0){
        [self.tittleView removeFromSuperview];
        [self.upView removeFromSuperview];
        [self.middleView removeFromSuperview];
        [self.downView removeFromSuperview];
    }
    
    /** 设置最上面的标题view */
    [self setupTittleView];
    /** 设置被选中的领导的view */
    [self setupUpView];
    /** 设置中间分隔的view*/
    [self setupMiddleView];
    /** 设置选择区域的领导的view */
    [self setupDownView];
    
    [self.contentView addSubview:self.tittleView];
    [self.contentView addSubview:self.upView];
    [self.contentView addSubview:self.middleView];
    [self.contentView addSubview:self.downView];
}

/**
 *被选中的领导的view
 */
-(void)setupUpView{
    if(_upLeaderBtns.count > 0){
        self.upView = [[UIView alloc]init];
        for(int i=0;i<_upLeaderBtns.count;i++){
            UIButton *chooseBtn = [[UIButton alloc]init];
            [chooseBtn setTintColor:WXCColor(211, 211, 211)];
            [chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            chooseBtn.tag = i;
            CGSize btnSize = CGSizeMake(leaderBtnWidth,leaderBtnHeight);
            if(i == 0){
                chooseBtn.frame = (CGRect){{0, leaderBtnMaginW}, btnSize};
            }else{
                CGFloat btnMaxX = CGRectGetMaxX(self.leaderBtnViewF) + leaderBtnMaginW;
                CGFloat nextBtnMaxX = btnMaxX + leaderBtnWidth;
                if(nextBtnMaxX > self.contentView.frame.size.width){
                    chooseBtn.frame = (CGRect){{0, CGRectGetMaxY(self.leaderBtnViewF) + leaderBtnMaginH}, btnSize};
                }else{
                    chooseBtn.frame = (CGRect){{btnMaxX, self.leaderBtnViewF.origin.y}, btnSize};
                }
            }
            
            chooseBtn.layer.cornerRadius = 14;
            [chooseBtn.layer setMasksToBounds:YES];
            [chooseBtn.layer setBorderWidth:1.0];   //边框宽度
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.8, 0.8, 0.8, 1 });
            [chooseBtn.layer setBorderColor:colorref];//边框颜色
            [chooseBtn setTitle:_upLeaderBtns[i] forState:UIControlStateNormal];
            chooseBtn.titleLabel.font = HWStatusCellContentFont;
            chooseBtn.backgroundColor = WXCColor(253, 253, 253);
            [chooseBtn addTarget:self action:@selector(clickLeaderBtn:)
                forControlEvents:UIControlEventTouchUpInside];
            
            [self.upView addSubview:chooseBtn];
            self.leaderBtnViewF = chooseBtn.frame;
            self.upView.tag = 0;
            self.upView.frame = CGRectMake(0, CGRectGetMaxY(self.tittleView.frame), 320, CGRectGetMaxY(self.leaderBtnViewF));
        }

    }else{
        self.upView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tittleView.frame), 320, 0)];
    }

}
/**
 *中间分隔的view
 */
-(void)setupMiddleView{
    self.middleView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.upView.frame), 320, 30)];
    self.middleView.backgroundColor = WXCColor(235, 235, 235);
    UILabel *clipLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 30)];
    clipLabel.text = @"点击添加需要查询的领导";
    clipLabel.font = HWStatusCellContentFont;
    [self.middleView addSubview:clipLabel];
}
/**
 *选择区域的领导的view
 */
-(void)setupDownView{
    if(_downLeaderBtns.count>0){
        self.downView = [[UIView alloc]init];
        for(int i=0;i<_downLeaderBtns.count;i++){
            UIButton *chooseBtn = [[UIButton alloc]init];
            [chooseBtn setTintColor:WXCColor(211, 211, 211)];
            [chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            chooseBtn.tag = i;
            CGSize btnSize = CGSizeMake(leaderBtnWidth,leaderBtnHeight);
            if(i == 0){
                chooseBtn.frame = (CGRect){{0, leaderBtnMaginW}, btnSize};
            }else{
                CGFloat btnMaxX = CGRectGetMaxX(self.chooseBtnViewF) + leaderBtnMaginW;
                CGFloat nextBtnMaxX = btnMaxX + leaderBtnWidth;
                if(nextBtnMaxX > self.contentView.frame.size.width){
                    chooseBtn.frame = (CGRect){{0, CGRectGetMaxY(self.chooseBtnViewF) + leaderBtnMaginH}, btnSize};
                }else{
                    chooseBtn.frame = (CGRect){{btnMaxX, self.chooseBtnViewF.origin.y}, btnSize};
                }
            }
            
            
            chooseBtn.layer.cornerRadius = 14;
            [chooseBtn.layer setMasksToBounds:YES];
            [chooseBtn.layer setBorderWidth:1.0];   //边框宽度
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.8, 0.8, 0.8, 1 });
            [chooseBtn.layer setBorderColor:colorref];//边框颜色
            [chooseBtn setTitle:_downLeaderBtns[i] forState:UIControlStateNormal];
            chooseBtn.titleLabel.font = HWStatusCellContentFont;
            chooseBtn.backgroundColor = WXCColor(253, 253, 253);
            [chooseBtn addTarget:self action:@selector(clickLeaderBtn:)
                forControlEvents:UIControlEventTouchUpInside];
            
            [self.downView addSubview:chooseBtn];
            self.chooseBtnViewF = chooseBtn.frame;
            self.downView.tag = 1;
            self.downView.frame = CGRectMake(0, CGRectGetMaxY(self.middleView.frame), 320, CGRectGetMaxY(self.chooseBtnViewF));
        }

    }else{
       self.downView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.middleView.frame), 320, 0)];
    }
   
}
/**
 *选择领导按钮的点击事件
 */
-(void)clickLeaderBtn:(UIButton*)btn{

    NSString *leaderName = btn.titleLabel.text;
    if(!_upLeaderBtns){
        self.upLeaderBtns = [NSMutableArray array];
    }
    if(!_downLeaderBtns){
        self.downLeaderBtns = [NSMutableArray array];
    }
    if(btn.superview.tag == 0){
        
        [_downLeaderBtns addObject:leaderName];
        [_upLeaderBtns removeObject:leaderName];
        
    }else if (btn.superview.tag == 1){
        
        [_upLeaderBtns addObject:leaderName];
        [_downLeaderBtns removeObject:leaderName];
       
    }
    
    [self setupSubviews];
    
}

- (IBAction)menuAction:(UIButton *)sender {
    
    CHTumblrMenuView *menuView = [[CHTumblrMenuView alloc] init];
    [menuView addMenuItemWithTitle:@"行政管理" andIcon:[UIImage imageNamed:@"post_type_bubble_party.png"] andSelectedBlock:^{
        self.transformBtnView.titleLabel.text = @"行政管理";
             NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"核安全局",@"startTime":@"2015年6月23日 13:30:00",@"endTime":@"2015年6月23日 15:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"秦三厂112大修核安全局临界检查后会议",@"joinPeople":@"方家山执照管理处邮件通知为主",@"editPeople":@"王五",@"other":@"请带好纸笔，会议期间不得接听电话"},@{@"icon":@"icon.png",@"name":@"张建成",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王奇文",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
        [self initPlanView:array];
    }];
    [menuView addMenuItemWithTitle:@"专项工作" andIcon:[UIImage imageNamed:@"post_type_bubble_zxgz.png"] andSelectedBlock:^{
        self.transformBtnView.titleLabel.text = @"专项工作";
        NSArray* array = @[@{@"icon":@"icon.png",@"name":@"李志勇",@"startTime":@"2015年6月23日 09:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"职业技能鉴定国家题库（核工业分库）阶段性审查会",@"joinPeople":@"人力资源处，集团公司人力资源部级职业技能鉴定指导中心，题库建设专家组成员等",@"editPeople":@"李四",@"other":@"请大家准备好命题"},@{@"icon":@"icon.png",@"name":@"核安全局",@"startTime":@"2015年6月23日 13:30:00",@"endTime":@"2015年6月23日 15:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"秦三厂112大修核安全局临界检查后会议",@"joinPeople":@"方家山执照管理处邮件通知为主",@"editPeople":@"王五",@"other":@"请带好纸笔，会议期间不得接听电话"},@{@"icon":@"icon.png",@"name":@"张建成",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王奇文",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
        [self initPlanView:array];
    }];
    [menuView addMenuItemWithTitle:@"党群会议" andIcon:[UIImage imageNamed:@"post_type_bubble_tower.png"] andSelectedBlock:^{
        self.transformBtnView.titleLabel.text = @"党群会议";
        NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张三",@"startTime":@"2015年6月23日 08:30:00",@"endTime":@"2015年6月23日 11:00:00",@"editTime":@"2015-04-01 11:12",@"content":@"公司党群茶话会，请大家务必准时参加，在二厂BX楼503会议室举行。",@"joinPeople":@"党群工作处",@"editPeople":@"李四",@"other":@"请大家准备好命题"},@{@"icon":@"icon.png",@"name":@"赵六",@"startTime":@"2015年6月23日 13:30:00",@"endTime":@"2015年6月23日 15:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"公司安全教育研讨会",@"joinPeople":@"张三，李四，王五，赵六，马云",@"editPeople":@"王五",@"other":@"请自备水"},@{@"icon":@"icon.png",@"name":@"王五",@"startTime":@"2015年6月23日 13:30:00",@"endTime":@"2015年6月23日 15:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"公司协同办公流程学习",@"joinPeople":@"张三，李四，王五，赵六，马云",@"editPeople":@"王五",@"other":@"请自备水"}];
        [self initPlanView:array];
        
    }];
    [menuView addMenuItemWithTitle:@"生产例会" andIcon:[UIImage imageNamed:@"post_type_bubble_product.png"] andSelectedBlock:^{
        self.transformBtnView.titleLabel.text = @"生产例会";
        NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张建成",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王奇文",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张涛",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
        [self initPlanView:array];
        
    }];
    [menuView addMenuItemWithTitle:@"培训及外出" andIcon:[UIImage imageNamed:@"post_type_bubble_travel.png"] andSelectedBlock:^{
        self.transformBtnView.titleLabel.text = @"培训外出";
        NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张三",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"如何成为一个优秀的程序员，这是一个值得深思的问题。",@"joinPeople":@"信息项目处，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王三类",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"工作思想会议，做出一年工作以来对公司制度的建议和对自己的自我反省",@"joinPeople":@"李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王莉莉",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"何炅",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"讨论关于日程APP设计问题，并给出好的意见和建议",@"joinPeople":@"信息项目处，张涛，张建成，培训管理处，公司分管领导，张三，李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
        [self initPlanView:array];
        
    }];
    [menuView addMenuItemWithTitle:@"其它" andIcon:[UIImage imageNamed:@"post_type_bubble_more.png"] andSelectedBlock:^{
        
        //创建本地通知对象
        UILocalNotification *notification = [[UILocalNotification alloc]init];
        
        //设置通知属性
        notification.soundName = @"tuisong.wav";
        //通知的具体内容
        notification.alertBody = @"星期四 09:30 - 11:45，公司一届六次职工代表大会";
        
        notification.alertAction = @"查看日程详细信息！";
        //通知第一次发出的时间
        notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        //设置跟随着当前时区
        notification.timeZone = [NSTimeZone defaultTimeZone];
        
        //        //应用程序图标数字显示
        //        notification.applicationIconBadgeNumber = 1;
        
        //重复时间 一天重复一次
        notification.repeatInterval =NSCalendarUnitDay;
        
        //调度通知（启动通知任务）
        [[UIApplication sharedApplication]scheduleLocalNotification:notification];
        
        self.transformBtnView.titleLabel.text = @"其它";
        NSArray* array = @[@{@"icon":@"icon.png",@"name":@"张成",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"分析如何能够让自己生活的快乐，讨论如何能更好的融入一个新环境",@"joinPeople":@"李四，王五，保健物理处，维修二处",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"王之和",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"设计一套完善的公司制度",@"joinPeople":@"赵六，张三，李四，王五",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"},@{@"icon":@"icon.png",@"name":@"张三分",@"startTime":@"2015年6月23日 9:30:00",@"endTime":@"2015年6月23日 11:30:00",@"editTime":@"2015-04-01 11:12",@"content":@"学习马克思主义，马泽东思想，邓小平理论，三个代表重要思想",@"joinPeople":@"全公司员工",@"editPeople":@"张三",@"other":@"会议期间请大家关闭手机，并认真做好会议记录"}];
        [self initPlanView:array];
        
    }];
    
    [menuView show];

}


- (IBAction)tittleBtnOnClick:(TeamFollowButton *)titleBtn {
    if (!self.isOpen) {// 没有打开
        [UIView animateWithDuration:0.5 animations:^{
            // 1.旋转按钮上的尖尖
            titleBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        // 改变当前按钮的状态
        self.open = YES;
        
        // 显示内容view
        //        self.contentView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            // 1.旋转按钮上的尖尖
            self.contentView.frame = CGRectMake(0, 0, 320, 432);
        }];
        
    }else // 已经打开
    {
        [UIView animateWithDuration:0.5 animations:^{
            // 1.旋转按钮上的尖尖
            titleBtn.imageView.transform = CGAffineTransformIdentity;
        }];
        // 改变当前按钮的状态
        self.open = NO;
        
        //        // 隐藏内容View
        //        self.contentView.hidden = YES;
        [UIView animateWithDuration:0.5 animations:^{
            // 1.旋转按钮上的尖尖
            self.contentView.frame = CGRectMake(0, -432, 320, 200);
        }];
    }
    
}

@end
