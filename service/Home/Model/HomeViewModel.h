//
//  HomeViewModel.h
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject
//图片名称
@property (nonatomic,copy) NSString *imaegName;
//标题
@property (nonatomic,copy) NSString *title;
//评分
@property (nonatomic,copy) NSString *grade;
//距离
@property (nonatomic,copy) NSString *distance;
//描述
@property (nonatomic,copy) NSString *describe;
//价格
@property (nonatomic,copy) NSString *price;
//旧价格
@property (nonatomic,copy) NSString *oldPrice;
//已出售
@property (nonatomic,copy) NSString *saleNumer;

- (NSMutableArray *)loadData;

@end
