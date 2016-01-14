//
//  CRScrollView.m
//  service
//
//  Created by shangzh on 16/1/14.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "CRScrollView.h"

@implementation CRScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.showsHorizontalScrollIndicator = NO;
        self.directionalLockEnabled = YES;
    }
    return self;
}

- (void)setUp {
    int count = (int)self.dataArr.count;
    self.contentSize = CGSizeMake((count*(self.itemWidth+self.maragn)+self.leftMargin*2), self.itemHeight);
    for (int i = 0; i < count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.leftMargin+i*(self.itemWidth+self.maragn), 0, self.itemWidth, self.itemHeight)];
        [btn setBackgroundImage:[UIImage imageNamed:self.dataArr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)itemClick:(UIButton *)btn {
    if ([self.crDelegate respondsToSelector:@selector(btnSelect:)]) {
        [self.crDelegate btnSelect:btn];
    }
}
@end
