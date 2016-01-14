//
//  WaiterInfoModel.h
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaiterInfoModel : NSObject

//服务人员图片
@property (nonatomic,copy) NSString *waiterImage;
//服务人员姓名
@property (nonatomic,copy) NSString *waiterName;
//服务人员ID
@property (nonatomic,copy) NSString *waiterID;
//服务人员评价数量
@property (nonatomic,copy) NSString *evaluateNumber;
//是否是推荐
@property (nonatomic,assign) BOOL recommend;
//对服务人员的评价内容
@property (nonatomic,strong) NSArray *evaluate;
//服务人员的服务项目
@property (nonatomic,strong) NSArray *serviceItem;
//是否显示所有服务
@property (nonatomic,assign) BOOL isAll;
//是否VIP
@property (nonatomic,assign) BOOL isVip;
//是否推荐
@property (nonatomic,assign) BOOL tuiJian;


+ (NSMutableArray *)lodaBussineData;

@end
