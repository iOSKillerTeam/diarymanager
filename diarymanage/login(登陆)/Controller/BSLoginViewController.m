//
//  BSLoginViewController.m
//  diarymanage
//
//  Created by wosinC on 15/8/29.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSLoginViewController.h"
#import "BSTabBarController.h"
#import "MBProgressHUD+NJ.h"
@interface BSLoginViewController ()
- (IBAction)LoginBtnOnClick:(id)sender;

@end

@implementation BSLoginViewController

- (void)viewDidLoad {
    _UserNameText.text = @"admin";
    _PasswordText.text = @"123456";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)LoginBtnOnClick:(id)sender {

    if([_UserNameText.text isEqual:@"admin"] && [_PasswordText.text isEqual:@"123456"]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        BSTabBarController *mainController =(BSTabBarController *) [storyboard instantiateViewControllerWithIdentifier:@"BSTabBarController"];
        
        [self presentViewController:mainController animated:YES completion:^{
            NSLog(@"登陆成功");
        }];
    }else{
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"登陆失败，请检查用户名密码是否正确"];
    }
    
    

}
@end
