//
//  ShareInfoViewCell.m
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ShareInfoViewCell.h"
#import "ShareInfoModel.h"

#import "UILabel+Manager.h"

#import "Constants.h"

@interface ShareInfoViewCell()

@property (nonatomic,strong) UIImageView *superImage;

@property (nonatomic,strong) UIImageView *vip;

@property (nonatomic,strong) UILabel *superName;

@property (nonatomic,strong) UIImageView *vipLeval;

@property (nonatomic,strong) UILabel *serviceID;

@property (nonatomic,strong) UILabel *location;

@property (nonatomic,strong) UILabel *time;

@property (nonatomic,strong) UILabel *title;

@property (nonatomic,strong) UILabel *content;
//图片
@property (nonatomic,strong) UIView *view;

@end

@implementation ShareInfoViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *superImage = [[UIImageView alloc] init];
        self.superImage = superImage;
        [self.contentView addSubview:self.superImage];
        
        UIImageView *vip = [[UIImageView alloc] init];
        self.vip = vip;
        [self.contentView addSubview:self.vip];
        
        UILabel *serviceId = [[UILabel alloc] init];
        self.serviceID = serviceId;
        [self.contentView addSubview:self.serviceID];
        
        UILabel *location = [[UILabel alloc] init];
        self.location = location;
        [self.contentView addSubview:self.location];
        
        UILabel *superName = [[UILabel alloc] init];
        self.superName = superName;
        [self.contentView addSubview:superName];
        
        UIImageView *vipLeavl = [[UIImageView alloc] init];
        self.vipLeval = vipLeavl;
        [self.contentView addSubview:vipLeavl];
        
        UILabel *time = [[UILabel alloc] init];
        self.time = time;
        [self.contentView addSubview:time];
        
        UILabel *title =[[UILabel alloc] init];
        self.title = title;
        [self.contentView addSubview:title];
        
        UILabel *content = [[UILabel alloc] init];
        self.content = content;
        [self.contentView addSubview:self.content];
        
        UIView *view = [[UIView alloc] init];
        self.view = view;
        [self.contentView addSubview:self.view];
        
    }
    return self;
}

- (void)setSharInfo:(ShareInfoModel *)sharInfo {
    _sharInfo = sharInfo;
    
    [self settingData];
    
    [self settingFrame];
    
}
- (void)settingData {
    
    self.superImage.image = [UIImage imageNamed:self.sharInfo.superImage];
    
    self.superName.text = self.sharInfo.superName;
    self.superName.textColor = kUIColorFromRGB(0x333333);
    self.superName.font = [UIFont systemFontOfSize:16];
    [self.superName sizeToFit];
    
    self.vip.image = [UIImage imageNamed:@"v"];
    
    self.location.text = self.sharInfo.location;
    self.location.textColor = kUIColorFromRGB(0xaaaaaa);
    self.location.font = [UIFont systemFontOfSize:12];
    [self.location sizeToFit];
    
    switch (self.sharInfo.vipLeval) {
        case 1:
            self.vipLeval.image = [UIImage imageNamed:@"v6"];
            break;
        case 2:
            self.vipLeval.image = [UIImage imageNamed:@"v6"];
            break;
        case 3:
            self.vipLeval.image = [UIImage imageNamed:@"v6"];
            break;
        case 4:
            self.vipLeval.image = [UIImage imageNamed:@"v6"];
            break;
        case 5:
            self.vipLeval.image = [UIImage imageNamed:@"v6"];
            break;
        case 6:
            self.vipLeval.image = [UIImage imageNamed:@"v6"];
            break;
        case 7:
            self.vipLeval.image = [UIImage imageNamed:@"v7"];
            break;
        default:
            break;
    }
    
    self.serviceID.text = [NSString stringWithFormat:@"服服ID:%@",self.sharInfo.serviceID];
    self.serviceID.font = [UIFont systemFontOfSize:12];
    self.serviceID.textColor = kUIColorFromRGB(0xaaaaaa);
    [self.serviceID sizeToFit];
    
    self.time.text = [NSString stringWithFormat:@"[%@]",self.sharInfo.time];
    self.time.textColor = kUIColorFromRGB(0x4343443);
    self.time.font = [UIFont systemFontOfSize:16];
    [self.time sizeToFit];
    
    self.title.text = [NSString stringWithFormat:@"# %@ # 分享",self.sharInfo.title];
    self.title.textColor = kUIColorFromRGB(0xff8b00);
    self.title.font = [UIFont systemFontOfSize:16];
    self.title.attributedText = [UILabel changeColorAndFontWith:self.title.text font:16 color:kUIColorFromRGB(0x434343) range:NSMakeRange(self.sharInfo.title.length+5, 2)];
    [self.title sizeToFit];
    
    self.content.text = self.sharInfo.content;
    self.content.textColor = kUIColorFromRGB(0x555555);
    self.content.font = [UIFont systemFontOfSize:14];
    self.content.numberOfLines = 2;
    [self.content sizeToFit];
    
}

- (void)settingFrame {
    self.superImage.frame = CGRectMake(8, 16, 44, 44);
    self.superName.frame = CGRectMake(62, 20, self.superName.bounds.size.width, self.superName.bounds.size.height);
    if (self.sharInfo.isVip) {
        self.vip.frame = CGRectMake(40, 48, 12, 12);
        self.vipLeval.frame = CGRectMake(62+self.superName.bounds.size.width+10, 20, 16, 16);
    }
    self.serviceID.frame = CGRectMake(62, 23+self.superName.bounds.size.height, self.serviceID.bounds.size.width, self.serviceID.bounds.size.height);
    self.location.frame = CGRectMake(kscreenWidth-self.location.bounds.size.width - 6, 20, self.location.bounds.size.width, self.location.bounds.size.height);
    self.time.frame = CGRectMake(8, 70, self.time.bounds.size.width, self.time.bounds.size.height);
    self.title.frame = CGRectMake(8+self.time.bounds.size.width+5, 70, self.title.bounds.size.width, self.title.bounds.size.height);
    
    self.content.frame = CGRectMake(8, 70+self.title.bounds.size.height+10, kscreenWidth-16, self.content.bounds.size.height*2);
    
    //图片
    int count = (int)self.sharInfo.imageArr.count;
    if (count > 0) {
        for (int i = 0; i < self.sharInfo.imageArr.count; i++) {
            CGFloat imageWidth = (kscreenWidth-26)/2;
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.sharInfo.imageArr[i]]];
            imageView.frame = CGRectMake(8+(imageWidth+10)*(i%2), i/2 * 160, imageWidth, 150);
            [self.view addSubview:imageView];
        }
    }
    
    if (count%2==0) {
        self.view.frame = CGRectMake(0, 92.0+ self.title.bounds.size.height+self.content.bounds.size.height, kscreenWidth, 160*(count/2));
        self.sharInfo.cellHeight = 97.0+ self.title.bounds.size.height+self.content.bounds.size.height+ 160*(count/2);
    } else {
        self.view.frame = CGRectMake(0, 92.0+ self.title.bounds.size.height+self.content.bounds.size.height, kscreenWidth, (count/2+1)*160);
        self.sharInfo.cellHeight = 97.0+ self.title.bounds.size.height+self.content.bounds.size.height+ (count/2+1)*160;
    }

}

@end
