//
//  ChatModel.m
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ChatModel.h"

#import "Unitl.h"
#import "Constants.h"

@implementation ChatModel

+ (NSArray *)loadMessageData {
    ChatModel *chat1 = [[ChatModel alloc] init];
    chat1.imageName = @"touxiang1";
    chat1.message = @"聊天内容";
    chat1.isSelf = NO;
    CGFloat textHeight1 = [Unitl countTextHeightWith:CGSizeMake(kscreenWidth-150, CGFLOAT_MAX) text:chat1.message];
    if (textHeight1 < 50) {
        chat1.cellHeight = 70;
    } else {
        chat1.cellHeight = textHeight1 + 30;
    }
    
    
    ChatModel *chat2 = [[ChatModel alloc] init];
    chat2.imageName = @"touxiang1";
    chat2.message = @"聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容";
    chat2.isSelf = NO;
    CGFloat textHeight2 = [Unitl countTextHeightWith:CGSizeMake(kscreenWidth-150, CGFLOAT_MAX) text:chat2.message];
    if (textHeight2 < 50) {
        chat2.cellHeight = 70;
    } else {
        chat2.cellHeight = textHeight2 + 30;
    }
    
    
    ChatModel *chat3 = [[ChatModel alloc] init];
    chat3.imageName = @"touxiang2";
    chat3.message = @"聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容";
    chat3.isSelf = YES;
    CGFloat textHeight3 = [Unitl countTextHeightWith:CGSizeMake(kscreenWidth-150, CGFLOAT_MAX) text:chat3.message];
    if (textHeight3 < 50) {
        chat3.cellHeight = 70;
    } else {
        chat3.cellHeight = textHeight3 + 30;
    }
    
    
    ChatModel *chat4 = [[ChatModel alloc] init];
    chat4.imageName = @"touxiang2";
    chat4.message = @"聊天内容";
    chat4.isSelf = YES;
    CGFloat textHeight4 = [Unitl countTextHeightWith:CGSizeMake(kscreenWidth-150, CGFLOAT_MAX) text:chat4.message];
    if (textHeight4 < 50) {
        chat4.cellHeight = 70;
    } else {
        chat4.cellHeight = textHeight4 + 30;
    }
    
    NSArray *arr = @[chat1,chat2,chat3,chat4];
    return arr;
}
@end
