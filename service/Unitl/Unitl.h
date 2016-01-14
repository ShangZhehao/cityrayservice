//
//  Unitl.h
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Unitl : NSObject
+ (void)createStartWith:(double)leveNumber firstImage:(UIImageView *)firstImage secondImage:(UIImageView *)secondImage threeImage:(UIImageView *)threeImage fourImage:(UIImageView *)fourImage fiveImage:(UIImageView *)fiveImage;

+ (void)changeStatusBarisWhite:(BOOL)isWhite;

+ (CGFloat)countTextHeightWith:(CGSize)size text:(NSString *)text;

+ (CGFloat)countTextWidthWith:(CGSize)size text:(NSString *)text textFont:(CGFloat)textFont;

@end
