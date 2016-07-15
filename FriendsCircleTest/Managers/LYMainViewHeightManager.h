//
//  LYMainViewHeightManager.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/13.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYFriendDynamicModel.h"

//容器视图到单元格边距
extern CGFloat const kMVHMSpaceOfCellAndContainView;
//好友动态的内容字体
extern CGFloat const kMVHMFriendDynamicContentFontSize;
//图片网格到容器视图边距
extern CGFloat const kMVHMSpaceOfContainViewAndImgcollectionView;
//图片网格中单元格最小的行间距和列间距
extern CGFloat const kMVHMMiniumInterLineItemSpace;

@interface LYMainViewHeightManager : NSObject

/**
 *  @author liyong
 *
 *  计算图片网格中单元格的size
 *
 *  @param imgCount 图片的个数
 *
 *  @return
 */
+ (CGSize)mainCellImgCollectionCellHeightWithCount:(NSInteger)imgCount;

/**
 *  @author liyong
 *
 *  计算图片网格的高度
 *
 *  @param imgCount 图片个数
 *
 *  @return
 */
+ (CGFloat)mainCellImgCollectionViewHeightWithCount:(NSInteger)imgCount;

/**
 *  @author liyong
 *
 *  计算朋友动态的内容的高度
 *
 *  @param friendDynamicModel 朋友动态模型
 *
 *  @return
 */
+ (CGFloat)mainCellFriendDynamicContentHeightWithModel:(LYFriendDynamicModel *)friendDynamicModel;

/**
 *  @author liyong
 *
 *  根据动态模型计算单元格高度
 *
 *  @param friendDynamicModel 动态模型
 *
 *  @return
 */
+ (CGFloat)mainCellHeightWithModel:(LYFriendDynamicModel *)friendDynamicModel;

@end
