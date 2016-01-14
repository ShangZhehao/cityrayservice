//
//  BussineInfoViewCell.m
//  service
//
//  Created by shangzh on 16/1/5.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "BussineInfoViewCell.h"
#import "BussineInfoModel.h"

#import "Unitl.h"

#import "Constants.h"

@interface BussineInfoViewCell()
@property (weak, nonatomic) IBOutlet UILabel *bussineName;
@property (weak, nonatomic) IBOutlet UILabel *evaluateNumber;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *mark;
@property (weak, nonatomic) IBOutlet UIImageView *startOne;
@property (weak, nonatomic) IBOutlet UIImageView *startTwo;
@property (weak, nonatomic) IBOutlet UIImageView *startThree;
@property (weak, nonatomic) IBOutlet UIImageView *startFour;
@property (weak, nonatomic) IBOutlet UIImageView *startFive;

@end

@implementation BussineInfoViewCell

+ (instancetype)Item {
    return [[[NSBundle mainBundle] loadNibNamed:@"BussineInfoViewCell" owner:self options:nil] lastObject];
}

- (void)setBussineInfo:(BussineInfoModel *)bussineInfo {
    _bussineInfo = bussineInfo;
    self.bussineName.text = bussineInfo.bussineName;
    self.evaluateNumber.text = [NSString stringWithFormat:@"%@人评价",bussineInfo.evaluateNumber];
    self.location.text = bussineInfo.location;
    [self.mark setTitle:bussineInfo.mark forState:UIControlStateNormal];
    self.mark.layer.borderColor = kUIColorFromRGB(0xff8b00).CGColor;
    self.mark.layer.borderWidth = 1;
    self.mark.layer.cornerRadius = 2;
    
    //星级
    [Unitl createStartWith:bussineInfo.leave firstImage:self.startOne secondImage:self.startTwo threeImage:self.startThree fourImage:self.startFour fiveImage:self.startFive];
    
}

@end
