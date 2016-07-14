//
//  LYMainTableViewCell.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/13.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYMainViewHeightManager.h"

@interface LYMainTableViewCell : UITableViewCell

/**
 *  @author liyong
 *
 *  构建单元格
 *
 *  @param friendDynamicModel 动态模型
 */
- (void)buildCellWithImgModel:(LYFriendDynamicModel *)friendDynamicModel;

@end
