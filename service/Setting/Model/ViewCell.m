//
//  ViewCell.m
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ViewCell.h"
#import "Constants.h"

#import "UIButton+Manager.h"

@implementation ViewCell

+ (NSArray *)addUserInfo {
    //用户信息
    ViewCell *cell1 = [[ViewCell alloc] init];
    UIView *userView = [[UIView alloc] init];
    
    UIImageView *userImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tuxiang"]];
    userImage.frame = CGRectMake((kscreenWidth-80)/2, 16, 80, 80);
    [userView addSubview:userImage];
    
    UIImageView *vip = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"V"]];
    vip.frame = CGRectMake(userImage.bounds.size.width-19, userImage.bounds.size.height-19, 19, 19);
    [userImage addSubview:vip];
    
    UILabel *name = [[UILabel alloc] init];
    name.text = @"郑笑笑";
    name.font = [UIFont systemFontOfSize:16];
    name.textColor = kUIColorFromRGB(0x333333);
    [name sizeToFit];
    name.frame = CGRectMake((kscreenWidth-name.bounds.size.width)/2, 106, name.bounds.size.width, name.bounds.size.height);
    [userView addSubview:name];
    
    UIImageView *vipRank = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v6"]];
    vipRank.frame = CGRectMake(name.frame.origin.x + name.bounds.size.width + 10, 106, vipRank.bounds.size.width, vipRank.bounds.size.height);
    [userView addSubview:vipRank];
    
    UILabel *nameId = [[UILabel alloc] init];
    nameId.text = @"服服ID:22763883701";
    nameId.textColor = kUIColorFromRGB(0xaaaaaa);
    nameId.font = [UIFont systemFontOfSize:16];
    [nameId sizeToFit];
    nameId.frame = CGRectMake((kscreenWidth-nameId.bounds.size.width)/2, 106+name.bounds.size.height+10, nameId.bounds.size.width, nameId.bounds.size.height);
    [userView addSubview:nameId];
    
    userView.frame = CGRectMake(0, 0, kscreenWidth, 136+name.bounds.size.height+nameId.bounds.size.height);
    cell1.height = 136+name.bounds.size.height+nameId.bounds.size.height;
    cell1.cellView = userView;
    
    
    ViewCell *cell2 = [[ViewCell alloc] init];
    cell2.height = 76;
    UIView *viewMen = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 60)];
    viewMen.backgroundColor = kUIColorFromRGB(0xffffff);
    CGFloat btnWidth = kscreenWidth/3;
    CGFloat btnHeight = 55;

    UIButton *menOne = [UIButton initwithFrame:CGRectMake(0, 5, btnWidth, btnHeight) imageName:@"fufuquan" titleMarage:0 title:@"服服券" titleFont:14 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [viewMen addSubview:menOne];
    
    UIButton *menTwo = [UIButton initwithFrame:CGRectMake(btnWidth, 5, btnWidth, btnHeight) imageName:@"shoucang" titleMarage:0 title:@"收藏" titleFont:14 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [viewMen addSubview:menTwo];
    
    UIButton *menThree = [UIButton initwithFrame:CGRectMake(btnWidth * 2, 5, btnWidth, btnHeight) imageName:@"mypinglun" titleMarage:0 title:@"评论" titleFont:14 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [viewMen addSubview:menThree];
    
    cell2.cellView = viewMen;
    
    NSArray *arr = @[cell1,cell2];
    return arr;
}

//我的订单
+ (NSArray *)addOrderInfo {
    
    CGFloat btnWidth = kscreenWidth/4;
    CGFloat btnHeight = 55;
    
    ViewCell *cell1 = [[ViewCell alloc] init];
    UIView *userOrder = [[UIView alloc] init];
   
    UILabel *orederTitle = [[UILabel alloc] init];
    orederTitle.text = @"我的订单";
    orederTitle.textColor = kUIColorFromRGB(0x333333);
    orederTitle.font = [UIFont systemFontOfSize:14];
    [orederTitle sizeToFit];
    orederTitle.frame = CGRectMake(12, 20, orederTitle.bounds.size.width, orederTitle.bounds.size.height);
    [userOrder addSubview:orederTitle];
    
    UIButton *obligation = [UIButton initwithFrame:CGRectMake(0, 30+orederTitle.bounds.size.height, btnWidth, btnHeight) imageName:@"daifukuan" titleMarage:0 title:@"待付款" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [userOrder addSubview:obligation];
    
    UIButton *noApply = [UIButton initwithFrame:CGRectMake(btnWidth, 30+orederTitle.bounds.size.height, btnWidth, btnHeight) imageName:@"daishiyong" titleMarage:0 title:@"待使用" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [userOrder addSubview:noApply];
    
    UIButton *evaluate = [UIButton initwithFrame:CGRectMake(btnWidth * 2, 30+orederTitle.bounds.size.height, btnWidth, btnHeight) imageName:@"daipingjia" titleMarage:0 title:@"待评价" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [userOrder addSubview:evaluate];
    
    UIButton *afterSales = [UIButton initwithFrame:CGRectMake(btnWidth * 3, 30+orederTitle.bounds.size.height, btnWidth, btnHeight) imageName:@"daipingjia" titleMarage:0 title:@"退款/售后" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [userOrder addSubview:afterSales];
    
    userOrder.frame = CGRectMake(0, 0, kscreenWidth, 125);
    cell1.height = 125;
    cell1.cellView = userOrder;
    
    NSArray *arr = @[cell1];
    return arr;
}


+ (NSArray *)addAssetsInfo {
    
    CGFloat lableWidth = kscreenWidth/3;
    CGFloat lableHeight = 15;
    //我的订单
    ViewCell *cell1 = [[ViewCell alloc] init];
    UIView *userAssets = [[UIView alloc] init];
    
    UILabel *assetsTitle = [[UILabel alloc] init];
    assetsTitle.text = @"我的资产";
    assetsTitle.textColor = kUIColorFromRGB(0x333333);
    assetsTitle.font = [UIFont systemFontOfSize:14];
    [assetsTitle sizeToFit];
    assetsTitle.frame = CGRectMake(12, 20, assetsTitle.bounds.size.width, assetsTitle.bounds.size.height);
    [userAssets addSubview:assetsTitle];

    //余额
    UILabel *balanceNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 45+assetsTitle.bounds.size.height, lableWidth, lableHeight)];
    balanceNumber.text = @"1000";
    balanceNumber.textAlignment = NSTextAlignmentCenter;
    balanceNumber.textColor = kUIColorFromRGB(0xff8b00);
    balanceNumber.font = [UIFont systemFontOfSize:16];
    [userAssets addSubview:balanceNumber];
    
    UILabel *balanceTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 55+assetsTitle.bounds.size.height+lableHeight, lableWidth, lableHeight)];
    balanceTitle.text = @"余额";
    balanceTitle.textAlignment = NSTextAlignmentCenter;
    balanceTitle.textColor = kUIColorFromRGB(0x434343);
    balanceTitle.font = [UIFont systemFontOfSize:14];
    [userAssets addSubview:balanceTitle];
    
    //积分
    UILabel *integralNumber = [[UILabel alloc] initWithFrame:CGRectMake(lableWidth, 45+assetsTitle.bounds.size.height, lableWidth, lableHeight)];
    integralNumber.text = @"50000";
    integralNumber.textAlignment = NSTextAlignmentCenter;
    integralNumber.textColor = kUIColorFromRGB(0xff8b00);
    integralNumber.font = [UIFont systemFontOfSize:16];
    [userAssets addSubview:integralNumber];
    
    UILabel *integralTitle = [[UILabel alloc] initWithFrame:CGRectMake(lableWidth, 55+assetsTitle.bounds.size.height+lableHeight, lableWidth, lableHeight)];
    integralTitle.text = @"积分";
    integralTitle.textAlignment = NSTextAlignmentCenter;
    integralTitle.textColor = kUIColorFromRGB(0x434343);
    integralTitle.font = [UIFont systemFontOfSize:14];
    [userAssets addSubview:integralTitle];
    
    //抵用券
    UILabel *ticketNumber = [[UILabel alloc] initWithFrame:CGRectMake(lableWidth * 2, 45+assetsTitle.bounds.size.height, lableWidth, lableHeight)];
    ticketNumber.text = @"50000";
    ticketNumber.textAlignment = NSTextAlignmentCenter;
    ticketNumber.textColor = kUIColorFromRGB(0xff8b00);
    ticketNumber.font = [UIFont systemFontOfSize:16];
    [userAssets addSubview:ticketNumber];
    
    UILabel *ticketTitle = [[UILabel alloc] initWithFrame:CGRectMake(lableWidth * 2, 55+assetsTitle.bounds.size.height+lableHeight, lableWidth, lableHeight)];
    ticketTitle.text = @"抵用券";
    ticketTitle.textAlignment = NSTextAlignmentCenter;
    ticketTitle.textColor = kUIColorFromRGB(0x434343);
    ticketTitle.font = [UIFont systemFontOfSize:14];
    [userAssets addSubview:ticketTitle];
    
    userAssets.frame = CGRectMake(0, 0, kscreenWidth, 110+assetsTitle.bounds.size.height);
    cell1.cellView = userAssets;
    cell1.height = userAssets.frame.size.height;
    
    NSArray *arr = @[cell1];
    return arr;
}


@end
