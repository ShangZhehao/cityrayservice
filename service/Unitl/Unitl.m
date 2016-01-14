//
//  Unitl.m
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "Unitl.h"
#import <UIKit/UIKit.h>

#import "Constants.h"

@implementation Unitl

+ (void)createStartWith:(double)leveNumber firstImage:(UIImageView *)firstImage secondImage:(UIImageView *)secondImage threeImage:(UIImageView *)threeImage fourImage:(UIImageView *)fourImage fiveImage:(UIImageView *)fiveImage {
    if (leveNumber == 0) {
        firstImage.image = [UIImage imageNamed:@"icon_star_gray"];
        secondImage.image = [UIImage imageNamed:@"icon_star_gray"];
        threeImage.image = [UIImage imageNamed:@"icon_star_gray"];
        fourImage.image =[UIImage imageNamed:@"icon_star_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    } else if (leveNumber > 0 && leveNumber < 1){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange_gray"];
        secondImage.image = [UIImage imageNamed:@"icon_star_gray"];
        threeImage.image = [UIImage imageNamed:@"icon_star_gray"];
        fourImage.image =[UIImage imageNamed:@"icon_star_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber == 1 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_gray"];
        threeImage.image = [UIImage imageNamed:@"icon_star_gray"];
        fourImage.image =[UIImage imageNamed:@"icon_star_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber > 1 && leveNumber < 2 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange_gray"];
        threeImage.image = [UIImage imageNamed:@"icon_star_gray"];
        fourImage.image =[UIImage imageNamed:@"icon_star_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber == 2 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange"];
        threeImage.image = [UIImage imageNamed:@"icon_star_gray"];
        fourImage.image =[UIImage imageNamed:@"icon_star_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber > 2 && leveNumber < 3){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange"];
        threeImage.image = [UIImage imageNamed:@"icon_star_orange_gray"];
        fourImage.image =[UIImage imageNamed:@"icon_star_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber == 3 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange"];
        threeImage.image = [UIImage imageNamed:@"icon_star_orange"];
        fourImage.image =[UIImage imageNamed:@"icon_star_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber > 3 && leveNumber < 4 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange"];
        threeImage.image = [UIImage imageNamed:@"icon_star_orange"];
        fourImage.image =[UIImage imageNamed:@"icon_star_orange_gray"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber == 4 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange"];
        threeImage.image = [UIImage imageNamed:@"icon_star_orange"];
        fourImage.image =[UIImage imageNamed:@"icon_star_orange"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_gray"];
    }else if (leveNumber > 4 && leveNumber < 5 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange"];
        threeImage.image = [UIImage imageNamed:@"icon_star_orange"];
        fourImage.image =[UIImage imageNamed:@"icon_star_orange"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_orange_gray"];
    }else if (leveNumber == 5 ){
        firstImage.image = [UIImage imageNamed:@"icon_star_orange"];
        secondImage.image = [UIImage imageNamed:@"icon_star_orange"];
        threeImage.image = [UIImage imageNamed:@"icon_star_orange"];
        fourImage.image =[UIImage imageNamed:@"icon_star_orange"];
        fiveImage.image = [UIImage imageNamed:@"icon_star_orange"];
    }

}


+ (void)changeStatusBarisWhite:(BOOL)isWhite {
    //显示状态栏
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    if (isWhite) {
        //样式白色
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    } else {
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    }
   
}

/**
 *  计算文本高度
 */
+ (CGFloat)countTextHeightWith:(CGSize)size text:(NSString *)text {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    
    CGRect titlerect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return titlerect.size.height;
}

+ (CGFloat)countTextWidthWith:(CGSize)size text:(NSString *)text textFont:(CGFloat)textFont{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:textFont];
    
    CGRect titlerect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return titlerect.size.width;
}
@end
