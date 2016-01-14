//
//  UICollectionView+ImageView.h
//  calfsalary
//
//  Created by shangzh on 15/9/11.
//  Copyright (c) 2015年 shangzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (ImageView)

+ (instancetype)initWithideten:(NSString *)idten itemSize:(CGSize)itemSize collectionY:(CGFloat)collectionY collectionWidth:(CGFloat)collectionWidth collectionHeight:(CGFloat)collectionHeight spance:(NSInteger)spance Inset:(NSInteger)inset;

@end
