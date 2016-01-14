//
//  LeftChatViewCell.m
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ChatViewCell.h"
#import "ChatModel.h"

#import "Constants.h"

@interface ChatViewCell()
//用户图像
@property (nonatomic,strong) UIImageView *userImage;
//消息
@property (nonatomic,strong) UIButton *message;
//时间
@property (nonatomic,strong) UILabel *time;

@end

@implementation ChatViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *superImage = [[UIImageView alloc] init];
        self.userImage = superImage;
        [self.contentView addSubview:self.userImage];
        
        UIButton *btn = [[UIButton alloc] init];
        self.message = btn;
        [self.contentView addSubview:self.message];
        
        UILabel *time = [[UILabel alloc] init];
        self.time = time;
        [self.contentView addSubview:self.time];
        
    }
    return self;
}

- (void)setChate:(ChatModel *)chate {
    _chate = chate;
    [self settingData];
    
    [self settingFrame];
}

- (void)settingData {
    self.userImage.image = [UIImage imageNamed:self.chate.imageName];
    
    self.time.text = self.chate.time;
    self.time.font = [UIFont systemFontOfSize:12];
    self.time.backgroundColor = kUIColorFromRGB(0xeeeeee);
    self.time.textColor = kUIColorFromRGB(0xffffff);
    self.time.layer.cornerRadius = 5;
    
}

- (void)settingFrame {
    //自己发送的信息
    CGFloat maragn = 20;
    CGFloat messageWidth = kscreenWidth-160;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    NSString *text = self.chate.message;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(messageWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    UILabel *mess = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, rect.size.width, rect.size.height)];
    mess.text = self.chate.message;
    mess.numberOfLines = 0;
    mess.font = [UIFont systemFontOfSize:14];
    
    if (self.chate.isSelf) {
        self.userImage.frame = CGRectMake(kscreenWidth-50-10, 5, 50, 50);
        
        if (rect.size.height+20 > messageWidth) {
            self.message.frame = CGRectMake(kscreenWidth-messageWidth-60, 5, rect.size.width+maragn, rect.size.height+maragn);
        } else {
            self.message.frame = CGRectMake(kscreenWidth-rect.size.width-60-maragn-10, 10, rect.size.width+maragn, rect.size.height+maragn);
        }
        [self.message setBackgroundImage:[UIImage imageNamed:@"chat_sender_bg"] forState:UIControlStateNormal];
    } else {
        self.userImage.frame = CGRectMake(10, 5, 50, 50);
        
        self.message.frame = CGRectMake(70, 5, rect.size.width+20, rect.size.height+20);
        
        [self.message setBackgroundImage:[UIImage imageNamed:@"chat_receiver_bg"] forState:UIControlStateNormal];
    }
    [self.message addSubview:mess];
}

@end
