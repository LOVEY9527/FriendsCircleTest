//
//  LYAppraiseListTableCell.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/8/16.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYAppraiseListTableCell.h"

#import "LYMainViewHeightManager.h"

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
    //评论人昵称
    self.appraiserNickName.text = appraiseModel.appraiserNickName;
    //评论内容
    self.appraiseContent.text = appraiseModel.appraiseContent;
    self.appraiseContent.font = [UIFont systemFontOfSize:kMVHMAppraiseContentFontSize];
//    self.appraiseContent.height = appraiseModel.appraiseContentHeight;
}

@end
