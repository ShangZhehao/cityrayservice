//
//  UIButton+Manager.m
//  service
//
//  Created by shangzh on 15/12/31.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "UIButton+Manager.h"
#import "Constants.h"

@implementation UIButton (Manager)

+ (instancetype)initWithTopImage:(CGRect)rect imaegName:(NSString *)imageName title:(NSString *)title titleFont:(CGFloat)titleFont target:(id)target action:(SEL)action {
    UIButton *btn =[[UIButton alloc] initWithFrame:rect];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
    [btn setTitleColor:kUIColorFromRGB(0x434343) forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

    btn.imageEdgeInsets = UIEdgeInsetsMake(-10, (rect.size.width-btn.imageView.bounds.size.width)/2, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(50, -(btn.imageView.bounds.size.width), 0, 0);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)tabbarWith:(CGRect)rect imaegName:(NSString *)imageName title:(NSString *)title titleFont:(CGFloat)titleFont target:(id)target action:(SEL)action {
    UIButton *btn =[[UIButton alloc] initWithFrame:rect];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
    [btn setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
    [btn setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(-10, (rect.size.width-btn.imageView.bounds.size.width)/2, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(30, -(btn.imageView.bounds.size.width)/2, 0, 0);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

/**
 *  图片在上面
 */
+ (instancetype)initwithFrame:(CGRect)rect imageName:(NSString *)imageName titleMarage:(CGFloat)titleMaragn title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:rect];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    image.frame = CGRectMake((rect.size.width - image.bounds.size.width)/2, 0, image.bounds.size.width, image.bounds.size.height);
    [btn addSubview:image];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:titleFont];
    label.textColor = titleColor;
    [label sizeToFit];
    label.frame = CGRectMake((rect.size.width-label.bounds.size.width)/2, image.bounds.size.height+titleMaragn, label.bounds.size.width, label.bounds.size.height);
    [btn addSubview:label];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


@end
