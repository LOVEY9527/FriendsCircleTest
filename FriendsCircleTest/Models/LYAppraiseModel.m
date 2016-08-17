//
//  LYAppraiseModel.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/8/16.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYAppraiseModel.h"

#import "LYMainViewHeightManager.h"

@implementation LYAppraiseModel

/**
 *  @author liyong
 *
 *  初始化接口(制造测试数据)
 *
 *  @param appraiseNickName 评论人昵称
 *  @param appraiseContent  评论内容
 *
 *  @return
 */
- (id)initWithAppraiseNickName:(NSString *)appraiseNickName
               appraiseContent:(NSString *)appraiseContent
{
    self = [super init];
    if (self)
    {
        self.appraiserNickName = appraiseNickName;
        self.appraiseContent = appraiseContent;
        
        //计算评论的高度
        [self computeAppraiseHeight];
    }
    
    return self;
}

/**
 *  @author liyong
 *
 *  计算评论单元格高度
 */
- (void)computeAppraiseHeight
{
    self.appraiseCellHeight = [LYMainViewHeightManager mainCellAppraiseCellHeightWithModel:self];
}

@end
