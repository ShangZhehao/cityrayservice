//
//  ShareInfoModel.m
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ShareInfoModel.h"

#import "Constants.h"

@implementation ShareInfoModel

+ (NSMutableArray *)loadData {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    ShareInfoModel *shar1 = [[ShareInfoModel alloc] init];
    shar1.superImage = @"imgV4_";
    shar1.superName = @"马华德";
    shar1.isVip = YES;
    shar1.vipLeval = 7;
    shar1.location = @"香蜜湖 0.3km";
    shar1.serviceID = @"23949566";
    shar1.time = @"09:45";
    shar1.title = @"牛人怎么拥有的八块腹肌";
    shar1.content = @"腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法";
    shar1.zhuanfa = @"1233";
    shar1.pinglun = @"2";
    shar1.zan = @"5";
    shar1.imageArr= @[@"super_img1",@"super_img2",@"super_img1"];
    shar1.cellHeight = [self countCellHeight:shar1.title content:shar1.content imageCount:(int)shar1.imageArr.count];
    [arr addObject:shar1];
    
    ShareInfoModel *shar2 = [[ShareInfoModel alloc] init];
    shar2.superImage = @"imgV3_";
    shar2.superName = @"马华德";
    shar2.isVip = YES;
    shar2.vipLeval = 6;
    shar2.location = @"香蜜湖 0.3km";
    shar2.serviceID = @"23949566";
    shar2.time = @"09:45";
    shar2.title = @"牛人怎么拥有的八块腹肌";
    shar2.content = @"腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法腹肌锻炼方法";
    shar2.zhuanfa = @"1233";
    shar2.pinglun = @"2";
    shar2.zan = @"5";
    shar2.cellHeight = [self countCellHeight:shar2.title content:shar2.content imageCount:(int)shar2.imageArr.count];
    [arr addObject:shar2];
    return arr;
}

+ (CGFloat)countCellHeight:(NSString *)title content:(NSString *)content imageCount:(int)imageCount {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
   
    CGRect titlerect = [title boundingRectWithSize:CGSizeMake(kscreenWidth-24, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    CGRect contentRect = [content boundingRectWithSize:CGSizeMake(kscreenWidth-24, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    if (imageCount%2==0) {
        return 97.0+titlerect.size.height+contentRect.size.height + 160*(imageCount/2);
    } else {
        return  97.0+ titlerect.size.height+contentRect.size.height+ (imageCount/2+1)*160;
    }
    
}
@end
