//
//  TabbarModel.m
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "TabbarModel.h"

@implementation TabbarModel

+ (NSArray *)loadTabbar {
    TabbarModel *model1 = [[TabbarModel alloc] init];
    model1.title = @"服服";
    model1.imageName = @"home";
    model1.state = YES;
    
    TabbarModel *model2 = [[TabbarModel alloc] init];
    model2.title = @"附近";
    model2.imageName = @"near";
    model2.state = NO;
    
    TabbarModel *model3 = [[TabbarModel alloc] init];
    model3.title = @"达人";
    model3.imageName = @"super";
    model3.state = NO;
    
    TabbarModel *model4 = [[TabbarModel alloc] init];
    model4.title = @"联系";
    model4.imageName = @"content";
    model4.state = NO;
    
    TabbarModel *model5 = [[TabbarModel alloc] init];
    model5.title = @"我的";
    model5.imageName = @"mine";
    model5.state = NO;
    
    NSArray *arr = @[model1,model2,model3,model4,model5];
    return arr;
}
@end
