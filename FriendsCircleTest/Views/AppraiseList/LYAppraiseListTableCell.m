//
//  LYAppraiseListTableCell.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/8/16.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYAppraiseListTableCell.h"

@interface LYAppraiseListTableCell()

//评论人头像
@property (weak, nonatomic) IBOutlet UIImageView *appraiserHeadImg;
//评论人昵称
@property (weak, nonatomic) IBOutlet UILabel *appraiserNickName;
//评论内容
@property (weak, nonatomic) IBOutlet UILabel *appraiseContent;

@end

@implementation LYAppraiseListTableCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  @author liyong
 *
 *  构建单元格
 *
 *  @param appraiseModel 评论模型
 */
- (void)buildCellWithModel:(LYAppraiseModel *)appraiseModel
{
    self.appraiserNickName.text = appraiseModel.appraiserNickName;
    self.appraiseContent.text = appraiseModel.appraiseContent;
}

@end
