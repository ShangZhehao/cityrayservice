//
//  BussineInfoViewCell.h
//  service
//
//  Created by shangzh on 16/1/5.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BussineInfoModel;

@interface BussineInfoViewCell : UITableViewCell

@property (nonatomic,strong) BussineInfoModel *bussineInfo;

+ (instancetype)Item;

@end
