//
//  ChatModel.h
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChatModel : NSObject

@property (nonatomic,copy) NSString *imageName;

@property (nonatomic,copy) NSString *message;

@property (nonatomic,copy) NSString *time;

@property (nonatomic,assign) BOOL isSelf;

@property (nonatomic,assign) CGFloat cellHeight;

+ (NSArray *)loadMessageData ;

@end
