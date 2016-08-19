//
//  LYFriendDynamicModel.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/14.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYFriendDynamicModel.h"
#import "LYMainViewHeightManager.h"

@implementation LYFriendDynamicModel

- (id)init
{
    self = [super init];
    if (self)
    {
        //数据初始化
        self.dynamicImgArray = [NSMutableArray arrayWithCapacity:0];
        self.appraiseArray = [NSMutableArray arrayWithCapacity:0];
    }
    
    return self;
}

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
               appraiseCount:(NSInteger)appraiseCount
{
    self = [self init];
    if (self)
    {
        //动态内容
        self.dynamicContent = dynamicContent;
        
        //动态图片数据
        for (int index = 0; index < imgCount; index++)
        {
            [self.dynamicImgArray addObject:@"1"];
        }
        
        //动态评价数据
        for (int index = 0; index < appraiseCount; index++)
        {
            LYAppraiseModel *appraiseModel;
            appraiseModel.appraiserNickName = @"Lovey";
            if (index % 2)
            {
                appraiseModel = [[LYAppraiseModel alloc] initWithAppraiseNickName:@"Lovey"
                                                                  appraiseContent:@"评论内容评论内容"];
            }else
            {
                appraiseModel = [[LYAppraiseModel alloc] initWithAppraiseNickName:@"Lovey"
                                                                  appraiseContent:@"评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论"];
            }
            [self.appraiseArray addObject:appraiseModel];
        }
        
        //计算动态单元格高度
        [self computeCellHeight];
    }
    
    return self;
}

/**
 *  @author liyong
 *
 *  计算动态单元格高度
 */
- (void)computeCellHeight
{
    CGFloat cellHeight = [LYMainViewHeightManager mainCellHeightWithModel:self];
    self.dynamicHeight = cellHeight;
}

@end
