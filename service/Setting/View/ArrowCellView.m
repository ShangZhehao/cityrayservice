//
//  ArrowCellView.m
//  service
//
//  Created by shangzh on 16/1/14.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ArrowCellView.h"

@implementation ArrowCellView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setUp {
    UILabel *title = [[UILabel alloc] init];
    title.text = self.title;
    title.font = [UIFont systemFontOfSize:self.titleFont];
    title.textColor = self.titleColor;
    [title sizeToFit];
    title.frame = CGRectMake(self.titleLeftMaragn, (self.bounds.size.height-title.bounds.size.height)/2, title.bounds.size.width, title.bounds.size.height);
    [self addSubview:title];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:self.arrowImageName];
    [imageView sizeToFit];
    imageView.frame = CGRectMake(self.bounds.size.width-self.imageRightMaragn-imageView.bounds.size.width, (self.bounds.size.height-imageView.bounds.size.height)/2, imageView.bounds.size.height, imageView.bounds.size.height);
    [self addSubview:imageView];
    
    UILabel *detail = [[UILabel alloc] init];
    detail.text = self.detailString;
    detail.font = [UIFont systemFontOfSize:self.detailFont];
    detail.textColor = self.detailColor;
    [detail sizeToFit];
    detail.frame = CGRectMake(self.bounds.size.width - self.imageRightMaragn - imageView.bounds.size.width - self.detailRightMaragn - detail.bounds.size.width, (self.bounds.size.height-detail.bounds.size.height)/2, detail.bounds.size.width, detail.bounds.size.height);
    [self addSubview:detail];
}
@end
