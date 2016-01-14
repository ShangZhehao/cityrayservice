//
//  UILabel+Manager.h
//  service
//
//  Created by shangzh on 16/1/6.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Manager)

+ (NSMutableAttributedString *)createCenterLineWith:(NSString *)title;

+ (NSMutableAttributedString *)changeColorAndFontWith:(NSString *)title font:(CGFloat)font color:(UIColor *)color range:(NSRange)range;

+ (instancetype)initWithTitle:(NSString *)title;
@end
