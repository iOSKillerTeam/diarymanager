//
//  BSReportFormWebViewController.m
//  diarymanage
//
//  Created by 吴新超 on 15/7/28.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSReportFormWebViewController.h"

@interface BSReportFormWebViewController ()<UIWebViewDelegate>

@end

@implementation BSReportFormWebViewController
-(void)loadView{
    self.view = [[UIWebView alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeHelp)];
    self.navigationItem.title = @"日程报表";
    
    UIWebView* webview = (UIWebView*) self.view;
    webview.delegate = self;
    
    NSString* path = @"http://richengreport.sinaapp.com/";
    NSURL* url = [NSURL URLWithString:path];
    NSURLRequest* request = [[NSURLRequest alloc]initWithURL:url];
    [webview loadRequest:request];

}

-(void)closeHelp{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
