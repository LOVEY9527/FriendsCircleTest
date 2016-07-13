//
//  LYMainViewHeightManager.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/13.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end
