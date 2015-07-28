//
//  BSNavigationController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/16.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSNavigationController.h"
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@implementation BSNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
}
//当该类第一次用到的时候就调用，因为设置导航控制器的主题颜色等只要设置一次就好了，如果放在viewDidLoad方法中，每次切换子控制器的时候都会调用，性能不好，所以把这些方法房子类初始化的方法里
+(void)initialize{
    //3.1,设置导航条主题(背景图片)（如果要同时设置很多NavigationBar的样式，可以通过设置UINavigationBar主题的方式来设置以便简化代码）
    UINavigationBar* bar = [UINavigationBar appearance];
    
    //3.2判断当前运行的操作系统的版本
    if([[UIDevice currentDevice].systemVersion doubleValue]>=7.0){
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
    }else{
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    }
    
    //3.3，设置导航条的标题颜色
    NSMutableDictionary* attr = [[NSMutableDictionary alloc]init];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [bar setTitleTextAttributes:attr];
    
    //设置导航条上返回按钮和图片的颜色为白色
    [bar setTintColor:[UIColor whiteColor]];
    
    //3.4，设置uibarbuttonitem的主题
    UIBarButtonItem* barItem = [UIBarButtonItem appearance];
    //设置字体颜色为白色
    NSMutableDictionary* attr2 = [[NSMutableDictionary alloc]init];
    attr2[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attr2[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [barItem setTitleTextAttributes:attr2 forState:UIControlStateNormal];
    
    //IOS6做适配
    if(!iOS7){
        //设置普通按钮的图片
        UIImage* norimage = [UIImage imageNamed:@"NavButton"];
        [barItem setBackgroundImage:norimage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        UIImage* pressedimage = [UIImage imageNamed:@"NavButtonPressed"];
        [barItem setBackgroundImage:pressedimage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
        //设置返回按钮的背景图片
        UIImage* norbackimage = [UIImage imageNamed:@"NavBackButton"];
        [barItem setBackButtonBackgroundImage:norbackimage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        UIImage* pressedbackimage = [UIImage imageNamed:@"NavBackButtonPressed"];
        [barItem setBackButtonBackgroundImage:pressedbackimage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //拿到目标控制器，设置它自动影藏TabBar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
