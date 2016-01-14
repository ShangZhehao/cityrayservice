//
//  WaiterInfoModel.m
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "WaiterInfoModel.h"
#import "ServiceItemModel.h"

@implementation WaiterInfoModel

+ (NSMutableArray *)lodaBussineData {
    WaiterInfoModel *waiter1 = [[WaiterInfoModel alloc] init];
    waiter1.waiterImage = @"imgV1_";
    waiter1.waiterName = @"郑笑笑";
    waiter1.waiterID = @"238847849";
    waiter1.evaluateNumber = @"238487";
    waiter1.recommend = YES;
    waiter1.evaluate = @[@"服务态度好",@"很专业"];
    waiter1.isVip = YES;
    waiter1.tuiJian = YES;
    waiter1.serviceItem = [ServiceItemModel loadBussineProductOne];
    if (waiter1.serviceItem.count > 2) {
        waiter1.isAll = NO;
    } else {
        waiter1.isAll = YES;
    }
    
    WaiterInfoModel *waiter2 = [[WaiterInfoModel alloc] init];
    waiter2.waiterImage = @"imgV5_";
    waiter2.waiterName = @"马舒雅";
    waiter2.waiterID = @"345633344";
    waiter2.evaluateNumber = @"22345";
    waiter2.recommend = NO;
    waiter2.evaluate = @[@"服务态度好",@"很专业"];
    waiter2.isVip = NO;
    waiter2.serviceItem = [ServiceItemModel loadBussineProductTwo];
    if (waiter2.serviceItem.count > 2) {
        waiter2.isAll = NO;
    } else {
        waiter2.isAll = YES;
    }
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:waiter2,waiter1, nil];
    return arr;
}

@end
