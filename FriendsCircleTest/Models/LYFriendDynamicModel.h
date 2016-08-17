//
//  LYFriendDynamicModel.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/14.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYAppraiseModel.h"

@interface LYFriendDynamicModel : NSObject

//动态内容
@property (copy, nonatomic) NSString *dynamicContent;
//动态图片数组
@property (strong, nonatomic) NSMutableArray *dynamicImgArray;
//动态评论的列表数据源
@property (strong, nonatomic) NSMutableArray<LYAppraiseModel *> *appraiseArray;

//该动态的整体高度
@property (assign, nonatomic) CGFloat dynamicHeight;
//动态的评论列表高度
@property (assign, nonatomic) CGFloat appraiseListHeight;

/**
 *  @author liyong
 *
 *  测试接口
 *
 *  @param imgCount      动态内容
 *  @param imgCount      图片数量
 *  @param zanCount      点赞数量
 *  @param appraiseCount 评论数量
 *
 *  @return
 */
- (id)initWithDynamicContent:(NSString *)dynamicContent
                  ImageCount:(NSInteger)imgCount
                zanCount:(NSInteger)zanCount
           appraiseCount:(NSInteger)appraiseCount;

@end
