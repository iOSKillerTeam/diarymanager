//
//  BSTabBarController.m
//  diarymanage
//
//  Created by 吴新超 on 15/6/16.
//  Copyright (c) 2015年 wuxinchao. All rights reserved.
//

#import "BSTabBarController.h"
#import "SKSplashIcon.h"

@interface BSTabBarController ()

@property (strong, nonatomic) SKSplashView *splashView;

//Demo of how to add other UI elements on top of splash view
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;

@end


@implementation BSTabBarController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self twitterSplash];
    //[self customLoadSplash];
    //[self snapchatSplash];
    //[self pingSplash];
    //[self fadeExampleSplash];
}

+(void)initialize{
    
    UITabBar* bar = [UITabBar appearance];
    
    CGRect frame = CGRectMake(0,200,320,48);
    
    UIView *v = [[UIView alloc]initWithFrame:frame];
    
    [v setBackgroundColor:[[UIColor alloc]initWithRed:70.0/255.0
                           
                                                green:65.0/255.0
                           
                                                 blue:62.0/255.0
                           
                                                alpha:1.0]];
    
    [bar insertSubview:v atIndex:0];
}

- (void) twitterSplash
{
  
    //Twitter style splash
    SKSplashIcon *twitterSplashIcon = [[SKSplashIcon alloc] initWithImage:[UIImage imageNamed:@"ying2.png"] animationType:SKIconAnimationTypeBounce];
    //UIColor *twitterColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cx_bg.jpg"]];
   // _splashView = [[SKSplashView alloc] initWithSplashIcon:twitterSplashIcon backgroundColor:twitterColor animationType:SKSplashAnimationTypeNone];
   
    _splashView = [[SKSplashView alloc] initWithSplashIcon:twitterSplashIcon backgroundImage:[UIImage imageNamed:@"cx_bg.jpg"] animationType:SKSplashAnimationTypeNone];
    
    
    
    _splashView.delegate = self; //Optional -> if you want to receive updates on animation beginning/end
    _splashView.animationDuration = 2; //Optional -> set animation duration. Default: 1s
    [self.view addSubview:_splashView];
    [_splashView startAnimation];
}

#pragma mark - Delegate methods

- (void) splashView:(SKSplashView *)splashView didBeginAnimatingWithDuration:(float)duration
{
    NSLog(@"Started animating from delegate");
    //To start activity animation when splash animation starts
    [_indicatorView startAnimating];
}

- (void) splashViewDidEndAnimating:(SKSplashView *)splashView
{
    NSLog(@"Stopped animating from delegate");
    //To stop activity animation when splash animation ends
    [_indicatorView stopAnimating];
    
    
}
@end
