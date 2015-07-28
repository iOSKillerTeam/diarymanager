//
//  WeiboCell.h
//  codeforcell
//
//  Created by 吴新超 on 15/4/1.
//  Copyright (c) 2015年 magina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiboInfo;
@interface WeiboCell : UITableViewCell
@property(strong,nonatomic) UIImageView* icon;
@property(strong,nonatomic) UILabel* name;
@property(strong,nonatomic) UILabel* ST;
@property(strong,nonatomic) UILabel* startTime;
@property(strong,nonatomic) UILabel* ET;
@property(strong,nonatomic) UILabel* endTime;
@property(strong,nonatomic) UILabel* editTime;
@property(strong,nonatomic) UILabel* CT;
@property(strong,nonatomic) UILabel* content;
@property(strong,nonatomic) UILabel* JP;
@property(strong,nonatomic) UILabel* joinPeople;
@property(strong,nonatomic) UILabel* OT;
@property(strong,nonatomic) UILabel* other;
@property(strong,nonatomic) UILabel* EP;
@property(strong,nonatomic) UILabel* editPeople;
@property(strong, nonatomic) UIView *originalView;
@property(strong,nonatomic) WeiboInfo* weiboInfo;
/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@property float rowHeight;
@end
