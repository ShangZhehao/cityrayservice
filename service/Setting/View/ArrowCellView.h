//
//  ArrowCellView.h
//  service
//
//  Created by shangzh on 16/1/14.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArrowCellView : UIView

@property (nonatomic,copy) NSString *title;

@property (nonatomic,assign) CGFloat titleFont;

@property (nonatomic,strong) UIColor *titleColor;

@property (nonatomic,assign) CGFloat titleLeftMaragn;

@property (nonatomic,copy) NSString *detailString;

@property (nonatomic,assign) CGFloat detailFont;

@property (nonatomic,strong) UIColor *detailColor;

@property (nonatomic,assign) CGFloat detailRightMaragn;

@property (nonatomic,copy) NSString *arrowImageName;

@property (nonatomic,assign) CGFloat imageRightMaragn;

- (void)setUp ;

@end
