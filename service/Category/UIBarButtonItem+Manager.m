//
//  UIBarButtonItem+Manager.m
//  service
//
//  Created by shangzh on 15/12/30.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "UIBarButtonItem+Manager.h"
#import "Constants.h"

@implementation UIBarButtonItem (Manager)

+ (instancetype)barbuttonItemWithLeftTitle:(NSString *)title titleFont:(CGFloat)titleFont rightImage:(UIImage *)image target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
    [btn setImage:image forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.frame = CGRectMake(0, 0, btn.bounds.size.width+10, btn.bounds.size.height);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.bounds.size.width-10, 0,0);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (instancetype)barbuttonItemWithFrame:(CGRect)rect BackImage:(UIImage *)image target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:rect];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}

+ (instancetype)barbuttonItemWithTitle:(NSString *)title titleFont:(CGFloat)titleFont target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
    [btn setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [btn sizeToFit];
     btn.frame = CGRectMake(0, 0, btn.bounds.size.width, btn.bounds.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (instancetype)barSpearcer {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    return negativeSpacer;
}
@end
