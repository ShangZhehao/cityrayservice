//
//  MessageViewCell.m
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "MessageViewCell.h"

@implementation MessageViewCell

+ (instancetype)Item {
   return [[[NSBundle mainBundle] loadNibNamed:@"MessageViewCell" owner:self options:nil] lastObject];
}

@end
