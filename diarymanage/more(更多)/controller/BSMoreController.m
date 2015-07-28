//
//  BSMoreController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/24.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSMoreController.h"
#import "MBProgressHUD+NJ.h"
#import "BSReportFormWebViewController.h"
@interface BSMoreController ()

@end

@implementation BSMoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            BSReportFormWebViewController* reportFormController = [[BSReportFormWebViewController alloc]init];
            
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:reportFormController];
            [self presentViewController:nav animated:YES completion:^{
                
            }];
        }
        
    }
    else if(indexPath.section == 2){
        if(indexPath.row == 0){
            [MBProgressHUD showMessage:@"正在拼命加载..."];
            [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(newVesion) userInfo:@"..." repeats:NO];
        }
        
    }
}

-(void)newVesion{
    [MBProgressHUD hideHUD];
    [MBProgressHUD showSuccess:@"当前已是最新版本"];
}

@end
