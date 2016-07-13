//
//  LYMainTableViewCell.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/13.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYMainTableViewCell.h"

static NSString *collectionViewCellReUseID = @"collectionViewCellReUseID";

@interface LYMainTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

//容器视图
@property (weak, nonatomic) IBOutlet UIView *containView;
//头像
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
//昵称
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
//发布时间
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
//动态内容
@property (weak, nonatomic) IBOutlet UILabel *dynamicContentLabel;

//图片网格布局
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *imgCollectionViewLayout;
//图片网格
@property (weak, nonatomic) IBOutlet UICollectionView *imgCollectionView;

//地址容器视图
@property (weak, nonatomic) IBOutlet UIView *addressContainView;
//地址
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

//评论按钮
@property (weak, nonatomic) IBOutlet UIButton *appraiseBtn;
//赞按钮
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;

@end

@implementation LYMainTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    //容器视图
    self.containView.layer.cornerRadius = 3;
    self.containView.layer.masksToBounds = YES;
    
    //头像
    self.headerImageView.layer.cornerRadius = self.headerImageView.width / 2;
    self.headerImageView.layer.masksToBounds = YES;
    
    //图片网格
    self.imgCollectionViewLayout.itemSize = CGSizeMake((self.imgCollectionView.width - 5 * 2) / 3, self.imgCollectionView.height);
    self.imgCollectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.imgCollectionViewLayout.minimumLineSpacing = 5;
    self.imgCollectionView.dataSource = self;
    self.imgCollectionView.delegate = self;
    [self.imgCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellReUseID];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellReUseID
                                                                           forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

@end
