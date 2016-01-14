//
//  SuperToolViewCell.m
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "SuperToolViewCell.h"
#import "ShareInfoModel.h"

@interface SuperToolViewCell()
@property (weak, nonatomic) IBOutlet UIButton *zhuanfa;
@property (weak, nonatomic) IBOutlet UIButton *pinglun;
@property (weak, nonatomic) IBOutlet UIButton *zan;

@end

@implementation SuperToolViewCell

+ (instancetype)Item {
    return [[[NSBundle mainBundle] loadNibNamed:@"SuperToolViewCell" owner:self options:nil] lastObject];
}

- (void)setShareInfo:(ShareInfoModel *)shareInfo {
    _shareInfo = shareInfo;
    [self.zhuanfa setTitle:shareInfo.zhuanfa forState:UIControlStateNormal];
    [self.pinglun setTitle:shareInfo.pinglun forState:UIControlStateNormal];
    [self.zan setTitle:shareInfo.zan forState:UIControlStateNormal];
}
@end
