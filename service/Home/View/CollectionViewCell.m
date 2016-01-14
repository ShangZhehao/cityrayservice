//
//  ImageCollectionViewCell.m
//  service
//
//  Created by shangzh on 15/12/30.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Constants.h"
#import "MenuModel.h"
#import "UIButton+Manager.h"

@interface CollectionViewCell()

@property (nonatomic,strong) UIView *menuView;

@end

@implementation CollectionViewCell

- (UIView *)menuView {
    if (_menuView == nil) {
        _menuView = [[UIView alloc] init];
        [self addSubview:self.menuView];
    }
    return _menuView;
}

- (void)setMenuArr:(NSArray *)menuArr {
    _menuArr = menuArr;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.menuView.frame = CGRectMake(0, 0, kscreenWidth, 120);
    
    int cout = (int)self.menuArr.count;
    CGFloat btnWidth = 50;
    CGFloat btnMaragn = (kscreenWidth-200)/5;
    CGFloat btnHeight = 60;
    
    for (int i = 0; i < cout; i++) {
        MenuModel *model = self.menuArr[i];
        CGRect rect = CGRectMake(0, 0, 0, 0);
        if (i < 4) {
            rect = CGRectMake(btnMaragn+(btnMaragn+btnWidth)*i, 16, btnWidth, btnHeight);
        } else {
            rect = CGRectMake(btnMaragn+(btnMaragn+btnWidth)*(i%4), 16+6+btnHeight, btnWidth, btnHeight);
        }
        UIButton *btn = [UIButton initWithTopImage:rect imaegName:model.imageName title:model.title titleFont:12 target:self action:nil];
        [self.menuView addSubview:btn];
    }
}

@end
