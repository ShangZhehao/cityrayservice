//
//  BussineInfoModel.m
//  service
//
//  Created by shangzh on 16/1/6.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "BussineInfoModel.h"
#import "ServiceItemModel.h"

@implementation BussineInfoModel

+ (NSMutableArray *)lodaBussineData {
    BussineInfoModel *bussineInfo = [[BussineInfoModel alloc] init];
    bussineInfo.bussineName = @"致芳华美容";
    bussineInfo.mark = @"附近热卖";
    bussineInfo.leave = 3.5;
    bussineInfo.evaluateNumber = @"32345";
    bussineInfo.location = @"华侨城 3.0km";
    bussineInfo.productArr = [ServiceItemModel loadBussineProductOne];
    if (bussineInfo.productArr.count > 2) {
        bussineInfo.isAll = NO;
    } else {
        bussineInfo.isAll = YES;
    }
    
    BussineInfoModel *bussineInfo2 = [[BussineInfoModel alloc] init];
    bussineInfo2.bussineName = @"琉璃时光SPA国际会所";
    bussineInfo2.mark = @"服服推荐";
    bussineInfo2.leave = 4.5;
    bussineInfo2.evaluateNumber = @"243445";
    bussineInfo2.location = @"华侨城 3.0km";
    bussineInfo2.productArr = [ServiceItemModel loadBussineProductTwo];
    if (bussineInfo2.productArr.count > 2) {
        bussineInfo2.isAll = NO;
    } else {
        bussineInfo2.isAll = YES;
    }
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:bussineInfo,bussineInfo2, nil];
    return arr;
}

@end
