//
//  BussineHomeModel.m
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "BussineHomeModel.h"

@implementation BussineHomeModel

+ (instancetype)lodaBussineData {
    BussineHomeModel *model = [[BussineHomeModel alloc] init];
    model.imageName = @"image_micro_enterprises_photo";
    model.bussineName = @"test";
    model.bussineID = @"23345677";
    model.bussineLeval = 3.5;
    model.isKing = YES;
    model.countNumber = @"12000.00";
    model.visitorNumber = @"100";
    model.ordeerNumber = @"100";
    
    return model;
}
@end
