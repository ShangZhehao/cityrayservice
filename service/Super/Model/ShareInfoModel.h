//
//  ShareInfoModel.h
//  service
//
//  Created by shangzh on 16/1/7.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShareInfoModel : NSObject
//图像
@property (nonatomic,copy) NSString *superImage;
//姓名
@property (nonatomic,copy) NSString *superName;
//服服ＩＤ
@property (nonatomic,copy) NSString *serviceID;
//地点
@property (nonatomic,copy) NSString *location;
//是否VIP
@property (nonatomic,assign) BOOL isVip;
//VIP等级
@property (nonatomic,assign) int vipLeval;
//时间
@property (nonatomic,copy) NSString *time;
//标题
@property (nonatomic,copy) NSString *title;
//内容
@property (nonatomic,copy) NSString *content;
//转发
@property (nonatomic,copy) NSString *zhuanfa;
//转发评论
@property (nonatomic,copy) NSString *pinglun;
//赞
@property (nonatomic,copy) NSString *zan;

@property (nonatomic,assign) CGFloat cellHeight;
//图片
@property (nonatomic,strong) NSArray *imageArr;

+ (NSMutableArray *)loadData ;

@end
