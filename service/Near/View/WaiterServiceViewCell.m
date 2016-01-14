//
//  WaiterServiceViewCell.m
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "WaiterServiceViewCell.h"
#import "ServiceItemModel.h"

#import "UILabel+Manager.h"

#import "Unitl.h"
#import "Constants.h"

@interface WaiterServiceViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *serviceImage;
@property (weak, nonatomic) IBOutlet UILabel *serviceName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *oldPrice;
@property (weak, nonatomic) IBOutlet UILabel *salerNumber;
@property (weak, nonatomic) IBOutlet UILabel *servaceLeave;
@property (weak, nonatomic) IBOutlet UIImageView *startOne;
@property (weak, nonatomic) IBOutlet UIImageView *startTwo;
@property (weak, nonatomic) IBOutlet UIImageView *startThree;
@property (weak, nonatomic) IBOutlet UIImageView *startFour;
@property (weak, nonatomic) IBOutlet UIImageView *startFive;

@end

@implementation WaiterServiceViewCell

+ (instancetype)Item {
    return [[[NSBundle mainBundle] loadNibNamed:@"WaiterServiceViewCell" owner:self options:nil] lastObject];
}

- (void)setServiceItem:(ServiceItemModel *)serviceItem {
    _serviceItem = serviceItem;
    
    self.serviceImage.image = [UIImage imageNamed:serviceItem.imageName];
    self.serviceName.text = serviceItem.servaceName;
    self.address.text = serviceItem.location;
    self.price.text = serviceItem.price;
    self.price.attributedText = [UILabel changeColorAndFontWith:serviceItem.price font:12 color:kUIColorFromRGB(0xff8b00) range:NSMakeRange(0, 1)];
    self.oldPrice.text = serviceItem.oldPrice;
    self.oldPrice.attributedText = [UILabel createCenterLineWith:serviceItem.oldPrice];
    self.salerNumber.text = [NSString stringWithFormat:@"已售 %@",serviceItem.salerNumber];
    self.servaceLeave.text = [NSString stringWithFormat:@"%.1f分",serviceItem.leave];
    
    //星级
    [Unitl createStartWith:serviceItem.leave firstImage:self.startOne secondImage:self.startTwo threeImage:self.startThree fourImage:self.startFour fiveImage:self.startFive];
}

@end
