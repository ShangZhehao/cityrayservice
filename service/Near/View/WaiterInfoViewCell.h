//
//  WaiterInfoViewCell.h
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaiterInfoModel;

@interface WaiterInfoViewCell : UITableViewCell

@property (nonatomic,strong) WaiterInfoModel *waiterInfo;

+ (instancetype)Item;

@end
