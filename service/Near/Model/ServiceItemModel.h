//
//  ServiceItemModel.h
//  service
//
//  Created by shangzh on 16/1/6.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceItemModel : NSObject
//服务图片
@property (nonatomic,copy) NSString *imageName;
//服务名称
@property (nonatomic,copy) NSString *servaceName;
//服务耗时
@property (nonatomic,copy) NSString *time;
//服务价格
@property (nonatomic,copy) NSString *price;
//服务原价格
@property (nonatomic,copy) NSString *oldPrice;
//已售数量
@property (nonatomic,copy) NSString *salerNumber;
//服务评分
@property (nonatomic,assign) double leave;
//地点
@property (nonatomic,copy) NSString *location;

+ (NSArray *)loadBussineProductOne;

+ (NSArray *)loadBussineProductTwo;

@end
