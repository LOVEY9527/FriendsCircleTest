//
//  LYAppraiseModel.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/8/16.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYAppraiseModel : NSObject

//评论人的头像URL
@property (strong, nonatomic) NSString *appraiserHeadImgURL;
//评论人的昵称
@property (strong, nonatomic) NSString *appraiserNickName;
//评论的内容
@property (strong, nonatomic) NSString *appraiseContent;

//评论单元格的高度
@property (assign, nonatomic) CGFloat appraiseCellHeight;
//评论内容高度
@property (assign, nonatomic) CGFloat appraiseContentHeight;

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
               appraiseContent:(NSString *)appraiseContent;

@end
