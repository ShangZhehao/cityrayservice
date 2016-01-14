//
//  ServiceItemModel.m
//  service
//
//  Created by shangzh on 16/1/6.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ServiceItemModel.h"

@implementation ServiceItemModel

+ (NSArray *)loadBussineProductOne {
    ServiceItemModel *service = [[ServiceItemModel alloc] init];
    service.servaceName = @"背部刮痧疗法";
    service.imageName = @"near_img1";
    service.time = @"30分钟";
    service.price = @"¥110.00";
    service.oldPrice = @"26.00";
    service.salerNumber = @"2345";
    service.leave = 3.5;
    service.location = @"华侨城 0.3km";
    
    ServiceItemModel *service2 = [[ServiceItemModel alloc] init];
    service2.servaceName = @"面部中药基础护理";
    service2.imageName = @"near_img2";
    service2.time = @"90分钟";
    service2.price = @"¥55.00";
    service2.oldPrice = @"26.00";
    service2.salerNumber = @"2345";
    service2.leave = 4.5;
    service2.location = @"华侨城 0.3km";
    
    NSArray *arr = @[service,service2];
    return arr;
}

+ (NSArray *)loadBussineProductTwo {
    ServiceItemModel *service = [[ServiceItemModel alloc] init];
    service.servaceName = @"玫瑰花瓣浴";
    service.imageName = @"near_img3";
    service.time = @"20分钟";
    service.price = @"¥260.00";
    service.oldPrice = @"26.00";
    service.salerNumber = @"2345";
    service.leave = 5.0;
    service.location = @"华侨城 0.3km";
    
    ServiceItemModel *service2 = [[ServiceItemModel alloc] init];
    service2.servaceName = @"肩颈基础护理";
    service2.imageName = @"near_img4";
    service2.time = @"90分钟";
    service2.price = @"¥55.00";
    service2.oldPrice = @"26.00";
    service2.salerNumber = @"2345";
    service2.leave = 4.8;
    service2.location = @"华侨城 0.3km";
    
    ServiceItemModel *service3 = [[ServiceItemModel alloc] init];
    service3.servaceName = @"玫瑰花瓣浴";
    service3.imageName = @"img3";
    service3.time = @"20分钟";
    service3.price = @"¥260.00";
    service3.oldPrice = @"26.00";
    service3.salerNumber = @"2345";
    service3.leave = 2.4;
    
    ServiceItemModel *service4 = [[ServiceItemModel alloc] init];
    service4.servaceName = @"肩颈基础护理";
    service4.imageName = @"img4";
    service4.time = @"90分钟";
    service4.price = @"¥55.00";
    service4.oldPrice = @"26.00";
    service4.salerNumber = @"2345";
    
    NSArray *arr = @[service,service2,service3,service4];
    return arr;
}

@end
