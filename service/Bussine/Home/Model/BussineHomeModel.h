//
//  BussineHomeModel.h
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BussineHomeModel : NSObject
//商家图片
@property (nonatomic,copy) NSString *imageName;
//商家名称
@property (nonatomic,copy) NSString *bussineName;
//服服ＩＤ
@property (nonatomic,copy) NSString *bussineID;
//星级
@property (nonatomic,assign) double bussineLeval;
//是否黄冠
@property (nonatomic,assign) BOOL isKing;
//今日成交总金额
@property (nonatomic,copy) NSString *countNumber;
//今日访客流量
@property (nonatomic,copy) NSString *visitorNumber;
//今日订单
@property (nonatomic,copy) NSString *ordeerNumber;

+ (instancetype)lodaBussineData ;

@end
