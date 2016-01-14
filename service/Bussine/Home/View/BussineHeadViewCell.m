//
//  BussineHeadViewCell.m
//  service
//
//  Created by shangzh on 16/1/8.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "BussineHeadViewCell.h"
#import "BussineHomeModel.h"

#import "Unitl.h"

@interface BussineHeadViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *bussineName;
@property (weak, nonatomic) IBOutlet UILabel *bussineID;
@property (weak, nonatomic) IBOutlet UIImageView *isKing;
@property (weak, nonatomic) IBOutlet UIImageView *firstStart;
@property (weak, nonatomic) IBOutlet UIImageView *secondStart;
@property (weak, nonatomic) IBOutlet UIImageView *trheeStart;
@property (weak, nonatomic) IBOutlet UIImageView *fourStart;
@property (weak, nonatomic) IBOutlet UIImageView *fiveStart;

@end

@implementation BussineHeadViewCell

+ (instancetype)Item {
    return [[[NSBundle mainBundle] loadNibNamed:@"BussineHeadViewCell" owner:self options:nil] lastObject];
}

- (void)setBussineModel:(BussineHomeModel *)bussineModel {
    _bussineModel = bussineModel;
    
    self.image.image = [UIImage imageNamed:bussineModel.imageName];
    self.bussineName.text = bussineModel.bussineName;
    self.bussineID.text = [NSString stringWithFormat:@"服服ID: %@",bussineModel.bussineID];

    if (!bussineModel.isKing) {
        self.isKing.hidden = YES;
    }
    [Unitl createStartWith:bussineModel.bussineLeval firstImage:self.firstStart secondImage:self.secondStart threeImage:self.trheeStart fourImage:self.fourStart fiveImage:self.fiveStart];
}
@end
