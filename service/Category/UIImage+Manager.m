//
//  UIImage+Manager.m
//  service
//
//  Created by shangzh on 15/12/29.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "UIImage+Manager.h"

@implementation UIImage (Manager)

+ (instancetype)imageWithOrginaName:(NSString *)name {
    UIImage *img = [UIImage imageNamed:name];
    
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
