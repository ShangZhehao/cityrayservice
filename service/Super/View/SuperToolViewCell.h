//
//  SuperToolViewCell.h
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareInfoModel;

@interface SuperToolViewCell : UITableViewCell

@property (nonatomic,strong) ShareInfoModel *shareInfo;

+ (instancetype)Item;

@end
