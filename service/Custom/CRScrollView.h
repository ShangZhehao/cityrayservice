//
//  CRScrollView.h
//  service
//
//  Created by shangzh on 16/1/14.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CRScrollViewDelegate <NSObject>

- (void)btnSelect:(UIButton *)btn;

@end


@interface CRScrollView : UIScrollView

@property (nonatomic,weak) id<CRScrollViewDelegate> crDelegate;

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,assign) CGFloat leftMargin;

@property (nonatomic,assign) CGFloat maragn;

@property (nonatomic,assign) CGFloat itemWidth;

@property (nonatomic,assign) CGFloat itemHeight;

- (void)setUp ;

@end
