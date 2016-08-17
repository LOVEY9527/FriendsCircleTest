//
//  LYAppraiseListTableCell.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/8/16.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYAppraiseModel.h"

@interface LYAppraiseListTableCell : UITableViewCell

/**
 *  @author liyong
 *
 *  构建单元格
 *
 *  @param appraiseModel 评论模型
 */
- (void)buildCellWithModel:(LYAppraiseModel *)appraiseModel;

@end
