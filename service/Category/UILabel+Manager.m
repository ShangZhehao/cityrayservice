//
//  UILabel+Manager.m
//  service
//
//  Created by shangzh on 16/1/6.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "UILabel+Manager.h"
#import "Constants.h"

@implementation UILabel (Manager)

/**
 *  添加中划线
 */
+ (NSMutableAttributedString *)createCenterLineWith:(NSString *)title {
    NSDictionary *oldPriceAttribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *oldPriceAttribtStr = [[NSMutableAttributedString alloc]initWithString:title attributes:oldPriceAttribtDic];
    return oldPriceAttribtStr;
}

/**
 *  改变部分字体的大小和颜色

 */
+ (NSMutableAttributedString *)changeColorAndFontWith:(NSString *)title font:(CGFloat)font color:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *priceAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [priceAttr setAttributes:@{NSForegroundColorAttributeName :color, NSFontAttributeName : [UIFont systemFontOfSize:font]} range:range];
    return priceAttr;
}

/**
 *  native title
 */
+ (instancetype)initWithTitle:(NSString *)title {
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.text = title;
    titleLable.font = [UIFont systemFontOfSize:17];
    titleLable.textColor = kUIColorFromRGB(0x333333);
    [titleLable sizeToFit];
    titleLable.frame = CGRectMake(0, 0, titleLable.bounds.size.width, titleLable.bounds.size.height);
    return titleLable;
}

@end
