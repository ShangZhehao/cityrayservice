//
//  BussineInfoModel.h
//  service
//
//  Created by shangzh on 16/1/6.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BussineInfoModel : NSObject
//商家名称
@property (nonatomic,copy) NSString *bussineName;
//评价数量
@property (nonatomic,copy) NSString *evaluateNumber;
//标注类型
@property (nonatomic,copy) NSString *mark;
//地点 距离
@property (nonatomic,copy) NSString *location;
//星级
@property (nonatomic,assign) double leave;
//服务
@property (nonatomic,strong) NSArray *productArr;
//是否显示所有服务
@property (nonatomic,assign) BOOL isAll;

+ (NSMutableArray *)lodaBussineData;

@end
