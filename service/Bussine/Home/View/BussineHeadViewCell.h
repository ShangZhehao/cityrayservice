//
//  BussineHeadViewCell.h
//  service
//
//  Created by shangzh on 16/1/8.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BussineHomeModel;

@interface BussineHeadViewCell : UITableViewCell

@property (nonatomic,strong) BussineHomeModel *bussineModel;

+ (instancetype)Item;

@end
