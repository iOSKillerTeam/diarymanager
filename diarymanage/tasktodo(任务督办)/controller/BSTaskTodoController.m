//
//  BSTaskTodoController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/23.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSTaskTodoController.h"
#import "TaskTodoInfo.h"
#import "TaskToCell.h"
@interface BSTaskTodoController ()
@property (strong,nonatomic) NSArray* taskTodos;
@end

@implementation BSTaskTodoController

- (void)viewDidLoad {
    [super viewDidLoad];
    _taskTodos = @[@{@"taskTittle":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"head":@"徐侃",@"createTime":@"2015-04-28"},@{@"taskTittle":@"5108、8109停役期间预案向电网报备，并代表公司组织后续工作",@"head":@"邹正宇",@"createTime":@"2015-04-21"},@{@"taskTittle":@"关注集团公司电量激励办法",@"head":@"王奇文",@"createTime":@"2015-05-12"},@{@"taskTittle":@"就秦三厂电瓶车火焰事件开发状态报告",@"head":@"刘崇都",@"createTime":@"2015-05-12"},@{@"taskTittle":@"修订借调和挂职人员的相关管理办法",@"head":@"刘崇都",@"createTime":@"2015-06-10"},@{@"taskTittle":@"修订借调和挂职人员的相关管理办法",@"head":@"刘崇都",@"createTime":@"2015-06-10"},@{@"taskTittle":@"制定技能培训中心所需物项的领用审批流程",@"head":@"王奇文",@"createTime":@"2015-06-16"},@{@"taskTittle":@"5108、8109停役期间预案向电网报备，并代表公司组织后续工作",@"head":@"邹正宇",@"createTime":@"2015-04-21"},@{@"taskTittle":@"测试日程管理APP的界面使用用户体验度",@"head":@"测试员",@"createTime":@"2015-06-17"},@{@"taskTittle":@"测试日程管理APP的界面使用用户体验度",@"head":@"测试员",@"createTime":@"2015-06-17"},@{@"taskTittle":@"国家能源委员会成立于2010年，当年4月，时任国务院总理温家宝主持召开了首次会议。",@"head":@"测试员",@"createTime":@"2015-06-17"},@{@"taskTittle":@"国家能源局数据显示，2012年全国弃风电量约200亿度，是2011年的一倍多，主要集中在西北、东北、华北地区。",@"head":@"张辽",@"createTime":@"2015-06-17"},@{@"taskTittle":@"国家核安全局已经批复通过徐大堡核电厂1、2机组厂址和海阳核电厂3、4号机组厂址的选择审查意见",@"head":@"测试员",@"createTime":@"2015-06-17"},];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _taskTodos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TaskToCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TaskTodoCell"];
    //如果缓存池中没有（第一次进入）也不用代码创建出这几个Cell那么直接去storyboard找cell（可以参考view的创建过程）
    if(cell == nil){
        cell = [TaskToCell taskToCell];
    }
    TaskTodoInfo* taskTodoInfo = [TaskTodoInfo taskTodoInfoWithDict:self.taskTodos[indexPath.row]];
    cell.taskTodoInfo = taskTodoInfo;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 171;
}



@end
