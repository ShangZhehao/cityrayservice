//
//  SearchFile.m
//  service
//
//  Created by shangzh on 15/12/30.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "SearchFile.h"

@implementation SearchFile

-(id)initWithFrame:(CGRect)frame Icon:(NSString*)iconName
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat height = frame.size.height;
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, height - 1, height - 2)];

        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
        icon.frame = CGRectMake(10, 10, 20, 16);
        [leftView addSubview:icon];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:leftView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = leftView.bounds;
        maskLayer.path = maskPath.CGPath;
        leftView.layer.mask = maskLayer;
        
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

-(CGRect) leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 1;
    return iconRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect placeRect = [super placeholderRectForBounds:bounds];
    placeRect.origin.y += 2;
    return placeRect;
}

@end
