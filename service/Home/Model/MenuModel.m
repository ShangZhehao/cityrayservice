//
//  MenuModel.m
//  service
//
//  Created by shangzh on 15/12/30.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "MenuModel.h"

@implementation MenuModel

+ (NSArray *)lodaMenuData {
    MenuModel *model1 = [[MenuModel alloc] init];
    model1.title = @"足疗按摩";
    model1.imageName = @"icon_zuliao";
    
    MenuModel *model2 = [[MenuModel alloc] init];
    model2.title = @"美容美甲";
    model2.imageName = @"icon_meirong";
    
    MenuModel *model3 = [[MenuModel alloc] init];
    model3.title = @"健身";
    model3.imageName = @"icon_jianshen";
    
    MenuModel *model4 = [[MenuModel alloc] init];
    model4.title = @"丽人理发";
    model4.imageName = @"icon_lifa";
    
    MenuModel *model5 = [[MenuModel alloc] init];
    model5.title = @"日常保洁";
    model5.imageName = @"icon_richang";
    
    MenuModel *model6 = [[MenuModel alloc] init];
    model6.title = @"家政服务";
    model6.imageName = @"icon_jiazheng";
    
    MenuModel *model7 = [[MenuModel alloc] init];
    model7.title = @"出行";
    model7.imageName = @"icon_chuxing";
    
    MenuModel *model8 = [[MenuModel alloc] init];
    model8.title = @"KTV";
    model8.imageName = @"icon_KTV";
    
    MenuModel *model9 = [[MenuModel alloc] init];
    model9.title = @"足疗按摩";
    model9.imageName = @"icon_zuliao";
    
    MenuModel *model10 = [[MenuModel alloc] init];
    model10.title = @"足疗按摩";
    model10.imageName = @"icon_zuliao";
    
    NSArray *arr = @[model1,model2,model3,model4,model5,model6,model7,model8,model9,model10];
    return arr;
}
@end
