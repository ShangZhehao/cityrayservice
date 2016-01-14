//
//  ViewCellModel.h
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CellItem.h"

@interface ViewCell : CellItem

@property (nonatomic,strong) UIView *cellView;

+ (NSArray *)addUserInfo;

+ (NSArray *)addOrderInfo;

+ (NSArray *)addAssetsInfo;

+ (NSArray *)help;

@end
