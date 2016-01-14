//
//  HomeeViewCell.h
//  service
//
//  Created by shangzh on 15/12/31.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewModel;
@interface HomeViewCell : UITableViewCell

@property (nonatomic,strong) HomeViewModel *homeModel;

+ (instancetype)Item;

@end
