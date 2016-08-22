//
//  LYMainViewHeightManager.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/13.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYMainViewHeightManager.h"

//容器视图到单元格边距
CGFloat const kMVHMSpaceOfCellAndContainView = 5.0;
//好友动态的内容字体
//(1、c语言中全局变量和static变量的初始化需要指定一个常量，不能是一个非常量的表达式；而在c++中是可以的
//2、在操作c和c++全局变量时，只能对其采用初始化的方式，而不能采用赋值的方式)
CGFloat const kMVHMFriendDynamicContentFontSize = 15.0;
//图片网格到容器视图边距
CGFloat const kMVHMSpaceOfContainViewAndImgcollectionView = 5.0;
//图片网格中单元格最小的行间距和列间距
CGFloat const kMVHMMiniumInterLineItemSpace = 5.0;
//好友动态评论内容字体
CGFloat const kMVHMAppraiseContentFontSize = 14.0;

@implementation LYMainViewHeightManager

/**
 *  @author liyong
 *
 *  计算朋友动态的内容的高度
 *
 *  @param friendDynamicModel 朋友动态模型
 *
 *  @return
 */
+ (CGFloat)mainCellFriendDynamicContentHeightWithModel:(LYFriendDynamicModel *)friendDynamicModel
{
    if ([friendDynamicModel.dynamicContent length] > 0)
    {
        CGFloat defineWidth = App_Frame_Width - (kMVHMSpaceOfCellAndContainView + 9) * 2;
        UIFont *friendDynamicContentFont = [UIFont systemFontOfSize:kMVHMFriendDynamicContentFontSize];
        CGFloat friendDynamicContentHeight = [friendDynamicModel.dynamicContent strHeightWithDefineWidth:defineWidth
                                                                                                    font:friendDynamicContentFont];
        
        return friendDynamicContentHeight;
    }
    
    return 0;
}

/**
 *  @author liyong
 *
 *  计算图片网格中单元格的size
 *
 *  @param imgCount 图片的个数
 *
 *  @return
 */
+ (CGSize)mainCellImgCollectionCellHeightWithCount:(NSInteger)imgCount
{
    CGSize itemSize;
    if (imgCount <= 0)
    {
        itemSize = CGSizeMake(0, 0);
    }else if (imgCount == 1)
    {
        CGFloat itemWidth = App_Frame_Width - (kMVHMSpaceOfCellAndContainView + kMVHMSpaceOfContainViewAndImgcollectionView) * 2;
        CGFloat itemHeight = (itemWidth / 3) * 2;
        itemSize = CGSizeMake(itemWidth, itemHeight);
    }else if((imgCount == 2) || (imgCount == 4))
    {
        CGFloat itemWidth = (App_Frame_Width - (kMVHMSpaceOfCellAndContainView + kMVHMSpaceOfContainViewAndImgcollectionView) * 2 - kMVHMMiniumInterLineItemSpace) / 2;
        CGFloat itemHeight = itemWidth;
        itemSize = CGSizeMake(itemWidth, itemHeight);
    }else if ((imgCount == 3) || (imgCount > 4))
    {
        CGFloat itemWidth = (App_Frame_Width - (kMVHMSpaceOfCellAndContainView + kMVHMSpaceOfContainViewAndImgcollectionView) * 2 - kMVHMMiniumInterLineItemSpace * 2) / 3;
        CGFloat itemHeight = itemWidth;
        itemSize = CGSizeMake(itemWidth, itemHeight);
    }
    
    return itemSize;
}

/**
 *  @author liyong
 *
 *  计算图片网格的高度
 *
 *  @param imgCount 图片个数
 *
 *  @return
 */
+ (CGFloat)mainCellImgCollectionViewHeightWithCount:(NSInteger)imgCount
{
    CGFloat collectionViewHeight;
    //单元格尺寸
    CGSize itemSize = [LYMainViewHeightManager mainCellImgCollectionCellHeightWithCount:imgCount];
    if (imgCount <= 0)
    {
        collectionViewHeight = 0;
    }else if (imgCount == 1)
    {
        collectionViewHeight = itemSize.height;
    }else if ((imgCount == 2) || (imgCount == 4))
    {
        //列数
        NSInteger interNum = 2;
        //行数
        NSInteger lineNum = imgCount / interNum  + ((imgCount % interNum > 0) ? 1 : 0);
        collectionViewHeight = lineNum * itemSize.height + (lineNum - 1) * kMVHMMiniumInterLineItemSpace;
    }else if ((imgCount == 3) || (imgCount > 4))
    {
        //列数
        NSInteger interNum = 3;
        //行数
        NSInteger lineNum = imgCount / interNum + ((imgCount % interNum > 0) ? 1 : 0);
        collectionViewHeight = lineNum * itemSize.height + (lineNum - 1) * kMVHMMiniumInterLineItemSpace;
    }
    
    return collectionViewHeight;
}

/**
 *  @author liyong
 *
 *  计算评论内容高度
 *
 *  @param appraiseModel 评论模型
 *
 *  @return
 */
+ (CGFloat)mainCellAppraiseContentHeightWithModel:(LYAppraiseModel *)appraiseModel
{
    CGFloat defineWidth = App_Frame_Width - kMVHMSpaceOfCellAndContainView * 2 - 63 - 8;
    UIFont *appraiseContentFont = [UIFont systemFontOfSize:kMVHMAppraiseContentFontSize];
    CGFloat appraiseContentHeight = [appraiseModel.appraiseContent strHeightWithDefineWidth:defineWidth
                                                                                       font:appraiseContentFont];
    
    return appraiseContentHeight;
}

/**
 *  @author liyong
 *
 *  计算评论单元格高度
 *
 *  @param appraiseModel 评论的模型
 *
 *  @return
 */
+ (CGFloat)mainCellAppraiseCellHeightWithModel:(LYAppraiseModel *)appraiseModel
{
    CGFloat appraiseContentHeight = [self mainCellAppraiseContentHeightWithModel:appraiseModel];
    appraiseModel.appraiseContentHeight = appraiseContentHeight;
    CGFloat totalAppraiseHeight = 17 + 15 + 5 + appraiseContentHeight + 8 + 1;
    if (totalAppraiseHeight < 60)
    {
        totalAppraiseHeight = 60;
    }
    
    return totalAppraiseHeight;
}

/**
 *  @author liyong
 *
 *  根据动态模型计算单元格高度
 *
 *  @param friendDynamicModel 动态模型
 *
 *  @return
 */
+ (CGFloat)mainCellHeightWithModel:(LYFriendDynamicModel *)friendDynamicModel
{
    //默认高度
    CGFloat cellHeight = 122;
    //动态内容高度
    CGFloat friendDynamicContentHeight = [LYMainViewHeightManager mainCellFriendDynamicContentHeightWithModel:friendDynamicModel];
    cellHeight += friendDynamicContentHeight;
    //图片网格高度
    CGFloat imgCollectionViewHeight = [LYMainViewHeightManager mainCellImgCollectionViewHeightWithCount:[friendDynamicModel.dynamicImgArray count]];
    cellHeight += imgCollectionViewHeight;
    //评论的高度
    for (LYAppraiseModel * _Nonnull obj in friendDynamicModel.appraiseArray)
    {
        friendDynamicModel.appraiseListHeight += obj.appraiseCellHeight;
    }
    cellHeight += friendDynamicModel.appraiseListHeight;
    
    return cellHeight;
}

@end
