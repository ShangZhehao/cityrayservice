//
//  TabbarModel.h
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabbarModel : NSObject
//标题
@property (nonatomic,copy) NSString *title;
//图片名称
@property (nonatomic,copy) NSString *imageName;
//状态
@property (nonatomic,assign) BOOL state;


+ (NSArray *)loadTabbar ;

@end
