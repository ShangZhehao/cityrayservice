//
//  CellItem.h
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CellItem : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *detaile;

@property (nonatomic,copy) NSString *imageName;

@property (nonatomic,assign) CGFloat height;

@property (nonatomic,copy) NSString *arrowImageName;

@property (nonatomic,strong) UIColor *color;

@end
