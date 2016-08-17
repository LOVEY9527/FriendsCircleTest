//
//  LYMainTableViewCell.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/13.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYMainTableViewCell.h"
#import "LYAppraiseListTableCell.h"
#import "LYZanListView.h"

NSString * const kMTVCIMGCollectionViewCellReUseID = @"kMTVCIMGCollectionViewCellReUseID";
NSString * const kMTVCAppraiseListCellReUseID = @"kMTVCAppraiseListCellReUseID";

@interface LYMainTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate>

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

//点赞类表视图
@property (weak, nonatomic) IBOutlet LYZanListView *zanListView;
//评论列表视图
@property (weak, nonatomic) IBOutlet UITableView *appraiseListTable;

//动态模型
@property (strong, nonatomic) LYFriendDynamicModel *friendDynamicModel;

@end

@implementation LYMainTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //容器视图
    self.containView.layer.cornerRadius = 3;
    self.containView.layer.masksToBounds = YES;
    
    //头像
    self.headerImageView.layer.cornerRadius = self.headerImageView.width / 2;
    self.headerImageView.layer.masksToBounds = YES;
    
    //动态内容
    self.dynamicContentLabel.font = [UIFont systemFontOfSize:kMVHMFriendDynamicContentFontSize];
    
    //图片网格
    self.imgCollectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.imgCollectionViewLayout.minimumLineSpacing = kMVHMMiniumInterLineItemSpace;
    self.imgCollectionViewLayout.minimumInteritemSpacing = kMVHMMiniumInterLineItemSpace;
    self.imgCollectionView.scrollsToTop = NO;
    self.imgCollectionView.dataSource = self;
    self.imgCollectionView.delegate = self;
    [self.imgCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kMTVCIMGCollectionViewCellReUseID];
    
    //点赞列表视图
    self.zanListView.height = 40;
    
    //评论列表视图
    self.appraiseListTable.height = 100;
    self.appraiseListTable.dataSource = self;
    self.appraiseListTable.delegate = self;
//    self.appraiseListTable.estimatedRowHeight = MAXFLOAT;
    [self.appraiseListTable registerNib:[UINib nibWithNibName:NSStringFromClass([LYAppraiseListTableCell class]) bundle:nil]
                 forCellReuseIdentifier:kMTVCAppraiseListCellReUseID];
    self.appraiseListTable.backgroundColor = UIColorFromRGB(0xf7f7f7);
    self.appraiseListTable.scrollsToTop = NO;
    self.appraiseListTable.scrollEnabled = NO;
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
 *  @param friendDynamicModel 动态模型
 */
- (void)buildCellWithImgModel:(LYFriendDynamicModel *)friendDynamicModel
{
    self.friendDynamicModel = friendDynamicModel;
    
    //动态内容
    self.dynamicContentLabel.font = [UIFont systemFontOfSize:kMVHMFriendDynamicContentFontSize];
    self.dynamicContentLabel.height = [LYMainViewHeightManager mainCellFriendDynamicContentHeightWithModel:self.friendDynamicModel];
    self.dynamicContentLabel.text = self.friendDynamicModel.dynamicContent;
    
    //图片网格
    self.imgCollectionView.top = self.dynamicContentLabel.bottom + 10;
    self.imgCollectionView.height = [LYMainViewHeightManager mainCellImgCollectionViewHeightWithCount:[self.friendDynamicModel.dynamicImgArray count]];
//    if ([self.friendDynamicModel.dynamicImgArray count] > 0)
//    {
    self.imgCollectionViewLayout.itemSize = [LYMainViewHeightManager mainCellImgCollectionCellHeightWithCount:[self.friendDynamicModel.dynamicImgArray count]];
    [self.imgCollectionView reloadData];
//    }
    
    //地址视图
    self.addressContainView.top = self.imgCollectionView.bottom + 10;
    
    //点赞按钮
    self.zanBtn.top = self.imgCollectionView.bottom + 12;
    
    //评论按钮
    self.appraiseBtn.top = self.imgCollectionView.bottom + 12;
    
    //点赞列表
    self.zanListView.top = self.addressContainView.bottom + 12;
    
    //评论列表
    self.appraiseListTable.top = self.zanListView.bottom;
    self.appraiseListTable.height = self.friendDynamicModel.appraiseListHeight;
    [self.appraiseListTable reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.friendDynamicModel.dynamicImgArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMTVCIMGCollectionViewCellReUseID
                                                                           forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.friendDynamicModel.appraiseArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYAppraiseListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kMTVCAppraiseListCellReUseID
                                                                    forIndexPath:indexPath];
    if (indexPath.row < [self.friendDynamicModel.appraiseArray count])
    {
        LYAppraiseModel *appraiseModel = [self.friendDynamicModel.appraiseArray objectAtIndex:indexPath.row];
        [cell buildCellWithModel:appraiseModel];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < [self.friendDynamicModel.appraiseArray count])
    {
        LYAppraiseModel *appraiseModel = [self.friendDynamicModel.appraiseArray objectAtIndex:indexPath.row];
        return appraiseModel.appraiseCellHeight;
    }
    
    return 0;
}

@end
