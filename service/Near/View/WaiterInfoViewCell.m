//
//  WaiterInfoViewCell.m
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "WaiterInfoViewCell.h"
#import "WaiterInfoModel.h"

#import "Unitl.h"
#import "Constants.h"

@interface WaiterInfoViewCell()
@property (nonatomic,strong) UIImageView *waiterImage;
@property (nonatomic,strong) UIImageView *isVip;
@property (nonatomic,strong) UILabel *waiterName;
@property (nonatomic,strong) UILabel *waiterID;
@property (nonatomic,strong) UILabel *evaluateNumber;
@property (nonatomic,strong) UIButton *tuijian;
@property (nonatomic,strong) UIButton *personality1;
@property (nonatomic,strong) UIButton *personality2;
@end

@implementation WaiterInfoViewCell

+ (instancetype)Item {
    return [[[NSBundle mainBundle] loadNibNamed:@"WaiterInfoViewCell" owner:self options:nil] lastObject];
}

- (void)setWaiterInfo:(WaiterInfoModel *)waiterInfo {
    _waiterInfo = waiterInfo;

    [self settingData];
    
    [self settingFrame];
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *waiterImage = [[UIImageView alloc] init];
        self.waiterImage = waiterImage;
        [self.contentView addSubview:self.waiterImage];
        
        UIImageView *isVip = [[UIImageView alloc] init];
        self.isVip = isVip;
        [self.contentView addSubview:self.isVip];
        
        UILabel *waiterName = [[UILabel alloc] init];
        self.waiterName = waiterName;
        [self.contentView addSubview:self.waiterName];
        
        UILabel *waiterID = [[UILabel alloc] init];
        self.waiterID = waiterID;
        [self.contentView addSubview:self.waiterID];
        
        UILabel *evaluateNumber = [[UILabel alloc] init];
        self.evaluateNumber = evaluateNumber;
        [self.contentView addSubview:self.evaluateNumber];
        
        UIButton *tuijian = [[UIButton alloc] init];
        self.tuijian = tuijian;
        [self.contentView addSubview:self.tuijian];
        
        UIButton *personality1 = [[UIButton alloc] init];
        self.personality1 = personality1;
        [self.contentView addSubview:self.personality1];
        
        UIButton *personality2 = [[UIButton alloc] init];
        self.personality2 = personality2;
        [self.contentView addSubview:self.personality2];
    }
    return self;
}

- (void)settingData {
    
    self.waiterImage.image = [UIImage imageNamed:self.waiterInfo.waiterImage];
    self.waiterName.text = self.waiterInfo.waiterName;
    self.waiterName.font = [UIFont systemFontOfSize:16];
    self.waiterName.textColor = kUIColorFromRGB(0x333333);
    
    self.waiterID.text = [NSString stringWithFormat:@"服服ID:%@",self.waiterInfo.waiterID];
    self.waiterID.font = [UIFont systemFontOfSize:14];
    self.waiterID.textColor = kUIColorFromRGB(0xaaaaaa);
    
    self.evaluateNumber.text = [NSString stringWithFormat:@"%@人评价",self.waiterInfo.evaluateNumber];
    self.evaluateNumber.font = [UIFont systemFontOfSize:14];
    self.evaluateNumber.textColor = kUIColorFromRGB(0xaaaaaa);
    
    if (!self.waiterInfo.isVip) {
        self.isVip.hidden = YES;
    }
    
    [self.tuijian setTitle:@"荐" forState:UIControlStateNormal];
    [self.tuijian.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.tuijian setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateNormal];
    self.tuijian.layer.borderWidth=1;
    self.tuijian.layer.borderColor = kUIColorFromRGB(0xff8b00).CGColor;
    self.tuijian.layer.cornerRadius = 2;
    
    
    [self.personality1 setTitle:self.waiterInfo.evaluate[0] forState:UIControlStateNormal];
    [self.personality1.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.personality1 setTitleColor:kUIColorFromRGB(0x5AD1B8) forState:UIControlStateNormal];
    self.personality1.layer.borderWidth=1;
    self.personality1.layer.borderColor = kUIColorFromRGB(0x5AD1B8).CGColor;
    self.personality1.layer.cornerRadius = 2;
    
    [self.personality2 setTitle:self.waiterInfo.evaluate[1] forState:UIControlStateNormal];
    [self.personality2.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.personality2 setTitleColor:kUIColorFromRGB(0xc968de) forState:UIControlStateNormal];
    self.personality2.layer.borderWidth=1;
    self.personality2.layer.borderColor = kUIColorFromRGB(0xc968de).CGColor;
    self.personality2.layer.cornerRadius = 2;
    
    if (self.waiterInfo.tuiJian) {
        self.tuijian.hidden = NO;
    }
}

- (void)settingFrame {
    self.waiterImage.frame = CGRectMake(8, 20, 44, 44);
    self.isVip.frame = CGRectMake(50, 44, 12, 12);
    
    [self.waiterName sizeToFit];
    self.waiterName.frame = CGRectMake(62, 25, self.waiterName.bounds.size.width, self.waiterName.bounds.size.height);
    
    [self.waiterID sizeToFit];
    self.waiterID.frame = CGRectMake(62, 25+self.waiterName.bounds.size.height + 3, self.waiterID.bounds.size.width, self.waiterID.bounds.size.height);
    
    [self.evaluateNumber sizeToFit];
    self.evaluateNumber.frame = CGRectMake(kscreenWidth-6-self.evaluateNumber.bounds.size.width, self.waiterID.frame.origin.y, self.evaluateNumber.bounds.size.width, self.evaluateNumber.bounds.size.height);
    
    
    CGFloat firstWidth = [Unitl countTextWidthWith:CGSizeMake(CGFLOAT_MAX, 20) text:self.waiterInfo.evaluate[0] textFont:14];
    CGFloat secondWidth = [Unitl countTextWidthWith:CGSizeMake(CGFLOAT_MAX, 20) text:self.waiterInfo.evaluate[1] textFont:14];
    if (self.waiterInfo.tuiJian) {
        [self.tuijian.titleLabel sizeToFit];
        self.tuijian.frame = CGRectMake(62+self.waiterName.bounds.size.width+10, 25, 25, 20);
        
        [self.personality1.titleLabel sizeToFit];
        self.personality1.frame = CGRectMake(62+self.waiterName.bounds.size.width+10+self.tuijian.bounds.size.width+5, 25, firstWidth+6, 20);
        
        [self.personality2.titleLabel sizeToFit];
        self.personality2.frame = CGRectMake(62+self.waiterName.bounds.size.width+10+self.tuijian.bounds.size.width+5+firstWidth+6+5, 25, secondWidth+6, 20);
    } else {
        [self.personality1.titleLabel sizeToFit];
        self.personality1.frame = CGRectMake(62+self.waiterName.bounds.size.width+10, 25, firstWidth+6, 20);
        
        [self.personality2.titleLabel sizeToFit];
        self.personality2.frame = CGRectMake(62+self.waiterName.bounds.size.width+10+firstWidth+6+5, 25, secondWidth+6, 20);
    }
}

@end
