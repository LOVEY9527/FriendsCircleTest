//
//  LYZanListView.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/8/15.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYZanListView.h"
#import "HYCollectViewAlignedLayout.h"

NSString * const kZLVCollectionViewCellReUseID = @"kZLVCollectionViewCellReUseID";

@interface LYZanListView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation LYZanListView

/**
 *  @author liyong
 *
 *  加载完nib视图
 */
- (void)awakeFromNib
{
    //背景色
    self.backgroundColor = UIColorFromRGB(0xf7f7f7);
    
    //icon视图
    UIImageView *zanIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 18, 18)];
    zanIconImageView.image = ImageNamed(@"main_zan");
    [self addSubview:zanIconImageView];
    
    //点赞列表
    HYCollectViewAlignedLayout *alignedLayout = [[HYCollectViewAlignedLayout alloc] initWithType:HYCollectViewAlignLeft];
    UICollectionView *zanListCollectView = [[UICollectionView alloc] initWithFrame:CGRectMake(30, 0, App_Frame_Width - 10 - 30, 40)
                                                              collectionViewLayout:alignedLayout];
    zanListCollectView.dataSource = self;
    zanListCollectView.delegate = self;
    [zanListCollectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kZLVCollectionViewCellReUseID];
    zanListCollectView.backgroundColor = [UIColor whiteColor];
    [self addSubview:zanListCollectView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kZLVCollectionViewCellReUseID
                                                                           forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

@end
