//
//  ServiceItemViewCell.h
//  service
//
//  Created by shangzh on 16/1/5.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ServiceItemModel;

@interface ServiceItemViewCell : UITableViewCell

@property (nonatomic,strong) ServiceItemModel *busineProduct;

+ (instancetype)Item;

@end
