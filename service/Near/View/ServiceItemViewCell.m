//
//  ServiceItemViewCell.m
//  service
//
//  Created by shangzh on 16/1/5.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ServiceItemViewCell.h"
#import "ServiceItemModel.h"

#import "UILabel+Manager.h"
#import "Constants.h"

@interface ServiceItemViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *serviceImage;
@property (weak, nonatomic) IBOutlet UILabel *serviceName;
@property (weak, nonatomic) IBOutlet UILabel *serviceTime;
@property (weak, nonatomic) IBOutlet UILabel *servicePrice;
@property (weak, nonatomic) IBOutlet UILabel *serviceOldPrice;
@property (weak, nonatomic) IBOutlet UILabel *salerNumber;

@end

@implementation ServiceItemViewCell

+ (instancetype)Item {
    return [[[NSBundle mainBundle] loadNibNamed:@"ServiceItemViewCell" owner:self options:nil] lastObject];
}

- (void)setBusineProduct:(ServiceItemModel *)busineProduct {
    _busineProduct = busineProduct;

    self.serviceImage.image = [UIImage imageNamed: busineProduct.imageName];
    self.serviceName.text = busineProduct.servaceName;
    self.servicePrice.text = busineProduct.price;
    self.servicePrice.attributedText = [UILabel changeColorAndFontWith:busineProduct.price font:12 color:kUIColorFromRGB(0xff8b00) range:NSMakeRange(0, 1)];
    self.serviceOldPrice.text = busineProduct.oldPrice;
    self.serviceOldPrice.attributedText = [UILabel createCenterLineWith:busineProduct.oldPrice];

    self.serviceTime.text = [NSString stringWithFormat:@"耗时: %@",busineProduct.time];
    self.salerNumber.text = [NSString stringWithFormat:@"已售 %@",busineProduct.salerNumber] ;
}


@end
