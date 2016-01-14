//
//  SettingViewCell.m
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "SettingViewCell.h"
#import "CellItem.h"
#import "ViewCell.h"

#import "Constants.h"

@implementation SettingViewCell

- (void)setCellItem:(CellItem *)cellItem {
    _cellItem = cellItem;
    
    self.textLabel.text = nil;
    self.accessoryView = nil;
    
    //清除cell缓存
    UIView *cellView = self.contentView;
    for (UIView *cell in cellView.subviews) {
        [cell removeFromSuperview];
    }
    
    if ([cellItem isKindOfClass:[ViewCell class]]) {
        ViewCell *cell = (ViewCell *)_cellItem;
        [self.contentView addSubview:cell.cellView];
    } else {
//        self.textLabel.text = cellItem.title;
//        [self.textLabel setFont:[UIFont systemFontOfSize:16]];
//        [self.textLabel setTextColor:kUIColorFromRGB(0x434343)];
//        self.detailTextLabel.text = cellItem.detaile;
//        self.textLabel.font = [UIFont systemFontOfSize:14];
//        self.textLabel.textColor = kUIColorFromRGB(0x333333);
//        [self.detailTextLabel setFont:[UIFont systemFontOfSize:16]];
//        [self.detailTextLabel setTextColor:kUIColorFromRGB(0x999999)];
//        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:cellItem.arrowImageName]];
//        self.accessoryView.frame = CGRectMake(kscreenWidth-24, 6, 24, 24);
    }
}

@end
