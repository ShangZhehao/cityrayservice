//
//  UIScrollView+Manager.m
//  service
//
//  Created by shangzh on 16/1/8.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "UIScrollView+Manager.h"

#import "Constants.h"

@implementation UIScrollView (Manager)

+(instancetype)initWithFrame:(CGRect)rect contentSize:(CGSize)contentSize {
    UIScrollView *sorceImage = [[UIScrollView alloc] initWithFrame:rect];
    sorceImage.showsHorizontalScrollIndicator = NO;
    // 设置内容大小
    sorceImage.contentSize = contentSize;
    // 是否同时运动,lock
    sorceImage.directionalLockEnabled = YES;
    sorceImage.showsHorizontalScrollIndicator = NO;
    sorceImage.showsVerticalScrollIndicator = NO;
    return  sorceImage;
}
@end
