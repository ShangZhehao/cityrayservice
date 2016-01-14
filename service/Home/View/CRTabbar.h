//
//  CRTabbar.h
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRTabbar;

@protocol CRTabbarDelegate <NSObject>

@optional
- (void)tabBar:(UIButton *)btn itemArr:(NSArray *)itemArr;

@end

@interface CRTabbar : UIView

@property (nonatomic,strong) NSArray *items;

@property (nonatomic,strong) id<CRTabbarDelegate> delegate;

@end
