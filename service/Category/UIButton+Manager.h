//
//  UIButton+Manager.h
//  service
//
//  Created by shangzh on 15/12/31.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Manager)

+ (instancetype)initWithTopImage:(CGRect)rect imaegName:(NSString *)imageName title:(NSString *)title titleFont:(CGFloat)titleFont target:(id)target action:(SEL)action ;

+ (instancetype)tabbarWith:(CGRect)rect imaegName:(NSString *)imageName title:(NSString *)title titleFont:(CGFloat)titleFont target:(id)target action:(SEL)action ;

+ (instancetype)initwithFrame:(CGRect)rect imageName:(NSString *)imageName titleMarage:(CGFloat)titleMaragn title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

@end
