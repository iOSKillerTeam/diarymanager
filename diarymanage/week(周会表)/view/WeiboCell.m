//
//  WeiboCell.m
//  codeforcell
//
//  Created by 吴新超 on 15/4/1.
//  Copyright (c) 2015年 magina. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiboInfo.h"
#define cellBorder 10//cell的边的宽高度
#define iconSize 40//iconimageview的宽高
#define HWStatusCellMagin 15
#define BSTittleContentMagin 2
#define BSLineHeigntMagin 5
// 正文字体
#define HWStatusCellContentFont [UIFont systemFontOfSize:14]
@implementation WeiboCell

/**
 重写set方法，让所有的cell往下挪
 */
-(void)setFrame:(CGRect)frame{
    frame.origin.y += HWStatusCellMagin;
    [super setFrame:frame];
}
/**
 *  cell的初始化方法，一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件，以及子控件的一次性设置
 */

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        //清楚cell的默认颜色
        self.backgroundColor = [UIColor clearColor];
        //点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpOriginal];
       
        
    }
    return  self;
}

-(void)setUpOriginal{
    _originalView = [[UIView alloc] init];
    [_originalView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:_originalView];
    
    _icon = [[UIImageView alloc]init];
    [_originalView addSubview:_icon];
    
    _name = [[UILabel alloc]init];
    [_originalView addSubview:_name];
    
    _ST = [[UILabel alloc]init];
    [_originalView addSubview:_ST];
    
    _startTime = [[UILabel alloc]init];
    [_originalView addSubview:_startTime];
    
    _ET = [[UILabel alloc]init];
    [_originalView addSubview:_ET];
    
    _endTime = [[UILabel alloc]init];
    [_originalView addSubview:_endTime];
    
    _editTime = [[UILabel alloc]init];
    [_originalView addSubview:_editTime];
    
    _CT = [[UILabel alloc]init];
    [_originalView addSubview:_CT];
    
    _content = [[UILabel alloc]init];
    [_originalView addSubview:_content];
    
    _JP = [[UILabel alloc]init];
    [_originalView addSubview:_JP];
    
    _joinPeople = [[UILabel alloc]init];
    [_originalView addSubview:_joinPeople];
    
    _OT = [[UILabel alloc]init];
    [_originalView addSubview:_OT];
    
    _other = [[UILabel alloc]init];
    [_originalView addSubview:_other];
    
    _EP = [[UILabel alloc]init];
    [_originalView addSubview:_EP];
    
    _editPeople = [[UILabel alloc]init];
    [_originalView addSubview:_editPeople];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//设置Cell的内容
-(void)setWeiboInfo:(WeiboInfo *)weiboInfo{
    _weiboInfo = weiboInfo;
    
    [self setWeiboDate];
    [self addSubview:_icon];
    [self settingWeiboCellSubviewFrame];
    NSLog(@"%@",_icon);
}
//设置Cell中subview数据
-(void)setWeiboDate{
    
    _icon.image = [UIImage imageNamed:_weiboInfo.icon];
    _name.text = _weiboInfo.name;
    _name.textColor = [UIColor orangeColor];
    _editTime.text = _weiboInfo.editTime;
    _editTime.textColor = [UIColor grayColor];
    _CT.text = @"会议内容：";
    _CT.textColor = [UIColor orangeColor];
    _CT.font = HWStatusCellContentFont;
    _content.text = _weiboInfo.content;
    _content.font = HWStatusCellContentFont;
    [_content setLineBreakMode:NSLineBreakByWordWrapping];
    _content.numberOfLines = 0;
    _ST.text = @"开始时间：";
    _ST.textColor = [UIColor orangeColor];
    _ST.font = HWStatusCellContentFont;
    _startTime.text = _weiboInfo.startTime;
    _startTime.font = HWStatusCellContentFont;
    _ET.text = @"结束时间：";
    _ET.textColor = [UIColor orangeColor];
    _ET.font = HWStatusCellContentFont;
    _endTime.text = _weiboInfo.endTime;
    _endTime.font = HWStatusCellContentFont;
    _JP.text = @"参加人员：";
    _JP.textColor = [UIColor orangeColor];
    _JP.font = HWStatusCellContentFont;
    _joinPeople.text = _weiboInfo.joinPeople;
    _joinPeople.font = HWStatusCellContentFont;
    [_joinPeople setLineBreakMode:NSLineBreakByWordWrapping];
    _joinPeople.numberOfLines = 0;
    _OT.text = @"备注：";
    _OT.textColor = [UIColor orangeColor];
    _OT.font = HWStatusCellContentFont;
    _other.text = _weiboInfo.other;
    _other.font = HWStatusCellContentFont;
    [_other setLineBreakMode:NSLineBreakByWordWrapping];
    _other.numberOfLines = 0;
    _EP.text = @"录入人：";
    _EP.textColor = [UIColor orangeColor];
    _EP.font = HWStatusCellContentFont;
    _editPeople.text = _weiboInfo.editPeople;
    _editPeople.font = HWStatusCellContentFont;
}
//设置Cell中subview的frame
-(void)settingWeiboCellSubviewFrame{
    
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    /**
     * 头像
     */
    CGFloat iconx = cellBorder;
    CGFloat icony = cellBorder;
    _icon.frame = CGRectMake(iconx, icony, iconSize,iconSize);
    
    /**
     * 会议主持
     */
    CGFloat namex = iconx + iconSize + cellBorder;
    CGFloat namey = icony;
    CGSize nameSize= [_weiboInfo.name sizeWithFont:_name.font];//计算用户名称的尺寸
    _name.frame = CGRectMake(namex, namey, nameSize.width, nameSize.height);

    /**
     * 会议录入时间
     */
    CGFloat timex = namex;
    CGFloat timey = namey+nameSize.height + BSLineHeigntMagin;
    CGSize timeSize= [_weiboInfo.editTime sizeWithFont:_editTime.font];//计算时间的尺寸
    _editTime.frame = CGRectMake(timex, timey, timeSize.width, timeSize.height);
    
    
    /**
     * 会议开始时间
     */
    CGFloat stX = iconx;
    CGFloat stY = MAX(CGRectGetMaxY(_editTime.frame), CGRectGetMaxY(_icon.frame))+cellBorder;
    CGSize stS= [_ST.text sizeWithFont:_ST.font];//计算时间的尺寸
    _ST.frame = CGRectMake(stX, stY, stS.width, stS.height);
    

    CGFloat startTimeX = CGRectGetMaxX(_ST.frame) + BSTittleContentMagin;
    CGFloat startTimeY = stY;
    CGSize startTimeSize= [_weiboInfo.startTime sizeWithFont:_startTime.font];//计算时间的尺寸
    _startTime.frame = CGRectMake(startTimeX, startTimeY, startTimeSize.width, startTimeSize.height);
    
    /**
     * 会议结束时间
     */
    CGFloat etX = iconx;
    CGFloat etY = startTimeY+startTimeSize.height+BSLineHeigntMagin;
    CGSize etS= [_ET.text sizeWithFont:_ET.font];//计算时间的尺寸
    _ET.frame = CGRectMake(etX, etY, etS.width, etS.height);
    
    CGFloat endTimeX = CGRectGetMaxX(_ET.frame) + BSTittleContentMagin;
    CGFloat endTimeY = etY;
    CGSize endTimeSize= [_weiboInfo.endTime sizeWithFont:_endTime.font];//计算时间的尺寸
    _endTime.frame = CGRectMake(endTimeX, endTimeY, endTimeSize.width, endTimeSize.height);
    
    /**
     * 会议内容
     */
    CGFloat ctX = iconx;
    CGFloat ctY = endTimeY+endTimeSize.height+BSLineHeigntMagin;
    CGSize ctS= [_CT.text sizeWithFont:_CT.font];//计算时间的尺寸
    _CT.frame = CGRectMake(ctX, ctY, ctS.width, ctS.height);
    
    CGFloat contentx = iconx;
    CGFloat contenty = CGRectGetMaxY(_CT.frame) + BSTittleContentMagin;
    CGFloat contentWidth = self.frame.size.width - (cellBorder*2);
    CGSize size = CGSizeMake(contentWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *attribute = @{NSFontAttributeName: _content.font};
    CGSize contentsize = [_content.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    _content.frame = CGRectMake(contentx, contenty, contentWidth, contentsize.height);
    
    /**
     * 参加会议人员
     */
    CGFloat jpX = iconx;
    CGFloat jpY = contenty+contentsize.height+BSLineHeigntMagin;
    CGSize jpS= [_JP.text sizeWithFont:_JP.font];//计算时间的尺寸
    _JP.frame = CGRectMake(jpX, jpY, jpS.width, jpS.height);
    
    CGFloat joinPeoplex = iconx;
    CGFloat joinPeopley = CGRectGetMaxY(_JP.frame) + BSTittleContentMagin;
    CGFloat joinPeopleWidth = self.frame.size.width - (cellBorder*2);
    CGSize joinPeopleSize= [_weiboInfo.joinPeople sizeWithFont:_joinPeople.font constrainedToSize:CGSizeMake(contentWidth, MAXFLOAT)];//计算时间的尺寸
    _joinPeople.frame = CGRectMake(joinPeoplex, joinPeopley, joinPeopleWidth, joinPeopleSize.height);
    
    /**
     * 录入人
     */
    CGFloat epx = iconx;
    CGFloat epy = joinPeopley+joinPeopleSize.height+BSLineHeigntMagin;
    CGSize eps= [_EP.text sizeWithFont:_EP.font];//计算时间的尺寸
    _EP.frame = CGRectMake(epx, epy, eps.width, eps.height);
    
    CGFloat editPeopleX = CGRectGetMaxX(_EP.frame) + BSTittleContentMagin;;
    CGFloat editPeopleY = epy;
    CGSize editPeopleSize= [_weiboInfo.editPeople sizeWithFont:_editPeople.font];//计算时间的尺寸
    _editPeople.frame = CGRectMake(editPeopleX, editPeopleY, editPeopleSize.width, editPeopleSize.height);
    
    /**
     * 备注
     */
    CGFloat otx = iconx;
    CGFloat oty = editPeopleY+editPeopleSize.height+BSLineHeigntMagin;
    CGSize ots= [_OT.text sizeWithFont:_OT.font];//计算时间的尺寸
    _OT.frame = CGRectMake(otx, oty, ots.width, ots.height);
    
    CGFloat otherx = iconx;
    CGFloat othery = CGRectGetMaxY(_OT.frame) + BSTittleContentMagin;
    CGFloat otherWidth = self.frame.size.width - (cellBorder*2);
    //_other.frame = CGRectMake(otherx, othery, otherWidth, otherSize.height);
    CGSize otherlinehsize = CGSizeMake(otherWidth,MAXFLOAT); //设置一个行高上限
    NSDictionary *otherattribute = @{NSFontAttributeName: _other.font};
    CGSize otherrealsize = [_other.text boundingRectWithSize:otherlinehsize options:NSStringDrawingUsesLineFragmentOrigin attributes:otherattribute context:nil].size;
    _other.frame = CGRectMake(otherx, othery, otherWidth, otherrealsize.height);
   
   
    //将图片的最高Y值+一个间距保存为这一行的行高
    _rowHeight = CGRectGetMaxY(_other.frame)+cellBorder;
    CGFloat originalX = 0;
    CGFloat originalY = 0;
    CGFloat originalW = cellW;
    
    _originalView.frame = CGRectMake(originalX, originalY, originalW, _rowHeight);
    self.cellHeight = _rowHeight + HWStatusCellMagin;
}


@end
