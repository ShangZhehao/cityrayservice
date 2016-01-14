//
//  HomeViewModel.m
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "HomeViewModel.h"

@interface HomeViewModel()
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation HomeViewModel

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (NSMutableArray *)loadData {
    HomeViewModel *model = [[HomeViewModel alloc] init];
    model.imaegName = @"img1";
    model.title = @"静静私家推拿足疗";
    model.grade = @"4.9分";
    model.distance = @"1.0km";
    model.describe = @"[华侨城]代金券至五折男女通用不限时段代金券至五折男女通用不限时段代金券至五折男女通用不限时段";
    model.price = @"¥80.00";
    model.oldPrice = @"136.00";
    model.saleNumer = @"222011";
    [self.dataArr addObject:model];
    
    HomeViewModel *model2 = [[HomeViewModel alloc] init];
    model2.imaegName = @"img2";
    model2.title = @"静静私家推拿足疗";
    model2.grade = @"4.9分";
    model2.distance = @"1.0km";
    model2.describe = @"[华侨城]代金券至五折男女通用不限时段代金券至五折男女通用不限时段代金券至五折男女通用不限时段";
    model2.price = @"¥80.00";
    model2.oldPrice = @"136.00";
    model2.saleNumer = @"222011";
    [self.dataArr addObject:model2];
    
    HomeViewModel *model3 = [[HomeViewModel alloc] init];
    model3.imaegName = @"img3";
    model3.title = @"静静私家推拿足疗";
    model3.grade = @"4.9分";
    model3.distance = @"1.0km";
    model3.describe = @"[华侨城]代金券至五折男女通用不限时段代金券至五折男女通用不限时段代金券至五折男女通用不限时段";
    model3.price = @"¥80.00";
    model3.oldPrice = @"136.00";
    model3.saleNumer = @"222011";
    [self.dataArr addObject:model3];
    
    HomeViewModel *model4 = [[HomeViewModel alloc] init];
    model4.imaegName = @"img4";
    model4.title = @"静静私家推拿足疗";
    model4.grade = @"4.9分";
    model4.distance = @"1.0km";
    model4.describe = @"[华侨城]代金券至五折男女通用不限时段代金券至五折男女通用不限时段代金券至五折男女通用不限时段";
    model4.price = @"¥80.00";
    model4.oldPrice = @"136.00";
    model4.saleNumer = @"222011";
    [self.dataArr addObject:model4];
    
    HomeViewModel *model5 = [[HomeViewModel alloc] init];
    model5.imaegName = @"img4";
    model5.title = @"静静私家推拿足疗";
    model5.grade = @"4.9分";
    model5.distance = @"1.0km";
    model5.describe = @"[华侨城]代金券至五折男女通用不限时段代金券至五折男女通用不限时段代金券至五折男女通用不限时段";
    model5.price = @"¥80.00";
    model5.oldPrice = @"136.00";
    model5.saleNumer = @"222011";
    [self.dataArr addObject:model5];
    
    HomeViewModel *model6 = [[HomeViewModel alloc] init];
    model6.imaegName = @"img4";
    model6.title = @"静静私家推拿足疗";
    model6.grade = @"4.9分";
    model6.distance = @"1.0km";
    model6.describe = @"[华侨城]代金券至五折男女通用不限时段代金券至五折男女通用不限时段代金券至五折男女通用不限时段";
    model6.price = @"¥80.00";
    model6.oldPrice = @"136.00";
    model6.saleNumer = @"222011";
    [self.dataArr addObject:model6];
    
    return self.dataArr;
}
@end
