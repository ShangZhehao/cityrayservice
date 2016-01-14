//
//  Constants.h
//  service
//
//  Created by shangzh on 15/12/29.
//  Copyright © 2015年 shangzh. All rights reserved.
//


#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight  [UIScreen mainScreen].bounds.size.height

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#ifdef DEBUG // 调试

#define PCLog(...) NSLog(__VA_ARGS__)

#else // 发布

#define PCLog(...)

#endif
