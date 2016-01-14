//
//  WaiterServiceViewCell.h
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ServiceItemModel;

@interface WaiterServiceViewCell : UITableViewCell

@property (nonatomic,strong) ServiceItemModel *serviceItem;

+ (instancetype)Item;

@end
