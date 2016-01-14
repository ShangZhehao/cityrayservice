//
//  CRTabbar.m
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "CRTabbar.h"
#import "UIButton+Manager.h"
#import "TabbarModel.h"

#import "Constants.h"

@interface CRTabbar()
@property (nonatomic,strong) UIButton *selectBtn;
@end

@implementation CRTabbar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int count = (int)self.items.count;
    
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    CGFloat btnW = W / count;
    CGFloat btnH = H;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        btnX = btnW * i;
        btn.tag = i;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.imageEdgeInsets = UIEdgeInsetsMake(-10, (btnW-btn.imageView.bounds.size.width)/2-2, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(30, -(btn.imageView.bounds.size.width+4), 0, 0);
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}

- (void)setItems:(NSArray *)items {
    
    _items = items;
    NSArray *btnMen = [TabbarModel loadTabbar];
    for (int i = 0;i < self.items.count;i++) {
        TabbarModel *model = btnMen[i];
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:model.title forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:model.imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[model.imageName stringByAppendingString:@"_pressed"]] forState:UIControlStateSelected];
        [btn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        [btn setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateSelected];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
    }
    
}

- (void)btnClick:(UIButton *)btn {
    
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    if ([_delegate respondsToSelector:@selector(tabBar:itemArr:)]) {
        [_delegate tabBar:btn itemArr:self.items];
    }
    
}


@end
