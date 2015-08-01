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
#import "BSContentShowController.h"
@interface BSTaskTodoController ()
//@interface BSTaskTodoController ()<TaskToCellDelegate>
@property (strong,nonatomic) NSArray* taskTodos;
//@property (strong,nonatomic) TaskToCell* taskToCell;
@end

@implementation BSTaskTodoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsSelection = NO;//将CELL设置成不可选中
//    _taskToCell.delegate = self;
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToContentShow:) name:@"pushToContentShow"object:nil];
    
    _taskTodos = @[@{@"t_id":@"0",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"就秦一厂人员违反工作组织过程进行作业事件做好经验反馈和状态报告的开发",@"head":@"徐侃",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-04-28"},@{@"t_id":@"1",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"5108、8109停役期间预案向电网报备，并代表公司组织后续工作",@"head":@"邹正宇",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-04-21"},@{@"t_id":@"2",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"关注集团公司电量激励办法",@"head":@"王奇文",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-05-12"},@{@"t_id":@"3",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"就秦三厂电瓶车火焰事件开发状态报告",@"head":@"刘崇都",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-05-12"},@{@"t_id":@"4",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"修订借调和挂职人员的相关管理办法",@"head":@"刘崇都",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-10"},@{@"t_id":@"5",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"修订借调和挂职人员的相关管理办法",@"head":@"刘崇都",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-10"},@{@"t_id":@"6",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"制定技能培训中心所需物项的领用审批流程",@"head":@"王奇文",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-16"},@{@"t_id":@"7",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"5108、8109停役期间预案向电网报备，并代表公司组织后续工作",@"head":@"邹正宇",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-04-21"},@{@"t_id":@"8",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"测试日程管理APP的界面使用用户体验度",@"head":@"测试员",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-17"},@{@"t_id":@"9",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"测试日程管理APP的界面使用用户体验度",@"head":@"测试员",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-17"},@{@"t_id":@"10",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"国家能源委员会成立于2010年，当年4月，时任国务院总理温家宝主持召开了首次会议。",@"head":@"测试员",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-17"},@{@"t_id":@"11",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"国家能源局数据显示，2012年全国弃风电量约200亿度，是2011年的一倍多，主要集中在西北、东北、华北地区。",@"head":@"张辽",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-17"},@{@"t_id":@"12",@"backHistory":@"从张涛处回退",@"taskCompletion":@"所以要把一件事情做好就必须坚持不断的关注行业的发展动态及未来的趋势走向；就要有良好的沟通协调能力，懂得上传下达，左右协调从而做到事半功倍；就要有高效的执行力，我们研究发现：一个企业的成功30%靠战略，60%靠企业各层的执行力，只有10%的其他因素。中国人在世界上都是出了名的“聪明而有智慧”，中国人不缺少战略家，缺少的是执行者！执行能力也是每个成功职场人必修炼的一种基本职业技能。还有很多需要修炼的基本技能，如：职场礼仪、时间管理及情绪管控等等，这里就不一一罗列。",@"taskContent":@"“职业知识技能”是做好一个职业应该具备的专业知识和能力。俗话说“三百六十行，行行出状元”没有过硬的专业知识，没有精湛的职业技能，就无法把一件事情做好，就更不可能成为“状元”了。",@"secretary":@"冯小辉，纵骋",@"taskUndertake":@"曾现涛",@"taskRecord":@"黄国炤",@"taskOffice":@"工会办公室",@"progress":@"完成",@"department":@"刘志勇",@"createTime":@"2015-01-13",@"responsePeople":@"刘志勇",@"officeLeader":@"黄国炤",@"taskTittle":@"国家核安全局已经批复通过徐大堡核电厂1、2机组厂址和海阳核电厂3、4号机组厂址的选择审查意见",@"head":@"测试员",@"assignPeople":@"徐侃",@"taskSource":@"2015-01总经理例会",@"completeTime":@"2015-06-17"},];

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
    cell.contentBtn.tag = indexPath.row;
    TaskTodoInfo* taskTodoInfo = [TaskTodoInfo taskTodoInfoWithDict:self.taskTodos[indexPath.row]];
    cell.taskTodoInfo = taskTodoInfo;
    
    cell.workFlowBtn.tag = indexPath.row;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 257;
}

//通知方法实现对cell上内容按钮的监听
-(void)pushToContentShow:(NSNotification*) notification{
    
     UIButton* obj = [notification object];//获取到传递的对象
    
    BSContentShowController* contentShowController = [[BSContentShowController alloc]init];
    self.navigationController.title = @"任务查看";
    
    TaskTodoInfo* taskTodoInfo = [TaskTodoInfo taskTodoInfoWithDict:self.taskTodos[obj.tag]];
    contentShowController.taskTodoInfo = taskTodoInfo;
    [self.navigationController pushViewController:contentShowController animated:YES];
}

/**
//代理方法监听cell上内容按钮的监听（失效）
-(void)taskToCellDelegateDelegateDidClickContentBtn:(TaskToCell *)taskToCell :(NSString *)content{
    NSLog(@"代理方法执行了");
    BSContentShowController* contentShowController = [[BSContentShowController alloc]init];
    self.navigationController.title = @"任务查看";
    
    [self.navigationController pushViewController:contentShowController animated:YES];
}
*/

@end
