//
//  UIBarButtonItem+Manager.h
//  service
//
//  Created by shangzh on 15/12/30.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Manager)

+ (instancetype)barbuttonItemWithLeftTitle:(NSString *)title titleFont:(CGFloat)titleFont rightImage:(UIImage *)image target:(id)target action:(SEL)action;

+ (instancetype)barbuttonItemWithFrame:(CGRect)rect BackImage:(UIImage *)image target:(id)target action:(SEL)action;

+ (instancetype)barbuttonItemWithTitle:(NSString *)title titleFont:(CGFloat)titleFont target:(id)target action:(SEL)action;

+ (instancetype)barSpearcer;

@end
