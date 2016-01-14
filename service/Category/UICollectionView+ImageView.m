//
//  UICollectionView+ImageView.m
//  calfsalary
//
//  Created by shangzh on 15/9/11.
//  Copyright (c) 2015年 shangzh. All rights reserved.
//

#import "UICollectionView+ImageView.h"
#import "CollectionViewCell.h"


@implementation UICollectionView (ImageView)


/**
 *  @param idten       注册ID
 *  @param itemSize    每页尺寸
 *  @param collectionY      UICollection Y坐标
 *  @param collectionWidth  UICollection widht
 *  @param collectionHeight <#collectionHeight description#>
 *  @param sapnce           item 之间的间距
 *  @param inset            图片右偏的距离
 *
 *  @return <#return value description#>
 */
+ (instancetype)initWithideten:(NSString *)idten itemSize:(CGSize)itemSize collectionY:(CGFloat)collectionY collectionWidth:(CGFloat)collectionWidth collectionHeight:(CGFloat)collectionHeight spance:(NSInteger)spance Inset:(NSInteger)inset {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.itemSize = itemSize;
    layout.minimumLineSpacing = spance;
    layout.sectionInset = UIEdgeInsetsMake(0, inset, 0, 0);
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, collectionWidth, collectionHeight) collectionViewLayout:layout];
    [collection registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:idten];
    collection.showsHorizontalScrollIndicator = NO;
    collection.showsVerticalScrollIndicator = NO;
    
    return collection;
    
}
@end
