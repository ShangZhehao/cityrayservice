//
//  HomeeViewCell.m
//  service
//
//  Created by shangzh on 15/12/31.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "HomeViewCell.h"
#import "HomeViewModel.h"
#import "Constants.h"
#import "UILabel+Manager.h"

@interface HomeViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *describe;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *oldPrice;
@property (weak, nonatomic) IBOutlet UILabel *saleNumer;

@end

@implementation HomeViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setHomeModel:(HomeViewModel *)homeModel {
    _homeModel = homeModel;
    
    self.imageView.image = [UIImage imageNamed:homeModel.imaegName];
    self.title.text = homeModel.title;
    self.grade.text = homeModel.grade;
    self.distance.text = homeModel.distance;
    self.describe.text = homeModel.describe;
    self.price.text = homeModel.price;
    self.price.attributedText = [UILabel changeColorAndFontWith:homeModel.price font:12 color:kUIColorFromRGB(0xff8b00) range:NSMakeRange(0, 1)];
    
    self.oldPrice.text = homeModel.oldPrice;
    self.oldPrice.attributedText = [UILabel createCenterLineWith:homeModel.oldPrice];
    
    self.saleNumer.text = [NSString stringWithFormat:@"已售 %@", homeModel.saleNumer];
    
}

+ (instancetype)Item {
    return [[[NSBundle mainBundle] loadNibNamed:@"HomeViewCell" owner:self options:nil] lastObject];
}

@end
