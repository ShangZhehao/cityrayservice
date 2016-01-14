//
//  MenuModel.h
//  service
//
//  Created by shangzh on 15/12/30.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuModel : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *imageName;

+(NSArray *)lodaMenuData;

@end
