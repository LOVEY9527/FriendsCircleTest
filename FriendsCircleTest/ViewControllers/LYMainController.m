//
//  LYMainController.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/12.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYMainController.h"
#import "LYMainTableViewCell.h"

NSString * const kMCTableViewCellReUseID = @"kLMCTableViewCellReUseID";

@interface LYMainController ()

//朋友动态数据源
@property (strong, nonatomic) NSMutableArray<LYFriendDynamicModel *> *friendDynamicDataSource;
//朋友动态高度数据源
@property (strong, nonatomic) NSMutableArray<NSNumber *> *friendDynamicCellHeightDataSource;

@end

@implementation LYMainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  @author liyong
 *
 *  初始化数据源
 */
- (void)initDataSource
{
    [super initDataSource];
    
    self.friendDynamicDataSource = [NSMutableArray arrayWithCapacity:0];
    self.friendDynamicCellHeightDataSource = [NSMutableArray arrayWithCapacity:0];
    
    LYFriendDynamicModel *friendDynamicModel = [[LYFriendDynamicModel alloc] init];
//    friendDynamicModel.dynamicImgArray = @[@"1"];
    [self.friendDynamicDataSource addObject:friendDynamicModel];
    CGFloat cellHeight = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight)];
    
    LYFriendDynamicModel *friendDynamicModel1 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel1.dynamicImgArray = @[@"1"];
    [self.friendDynamicDataSource addObject:friendDynamicModel1];
    CGFloat cellHeight1 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel1];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight1)];
    
    LYFriendDynamicModel *friendDynamicModel2 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel2.dynamicImgArray = @[@"1", @"2"];
    [self.friendDynamicDataSource addObject:friendDynamicModel2];
    CGFloat cellHeight2 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel2];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight2)];
    
    LYFriendDynamicModel *friendDynamicModel3 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel3.dynamicImgArray = @[@"1", @"2", @"3"];
    [self.friendDynamicDataSource addObject:friendDynamicModel3];
    CGFloat cellHeight3 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel3];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight3)];
    
    LYFriendDynamicModel *friendDynamicModel4 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel4.dynamicImgArray = @[@"1", @"2", @"3", @"4"];
    [self.friendDynamicDataSource addObject:friendDynamicModel4];
    CGFloat cellHeight4 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel4];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight4)];
    
    LYFriendDynamicModel *friendDynamicModel5 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel5.dynamicImgArray = @[@"1", @"2", @"3", @"4", @"5"];
    [self.friendDynamicDataSource addObject:friendDynamicModel5];
    CGFloat cellHeight5 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel5];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight5)];
    
    LYFriendDynamicModel *friendDynamicModel6 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel6.dynamicImgArray = @[@"1", @"2", @"3", @"4", @"5", @"6"];
    [self.friendDynamicDataSource addObject:friendDynamicModel6];
    CGFloat cellHeight6 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel6];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight6)];
    
    LYFriendDynamicModel *friendDynamicModel7 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel7.dynamicImgArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    [self.friendDynamicDataSource addObject:friendDynamicModel7];
    CGFloat cellHeight7 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel7];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight7)];
    
    LYFriendDynamicModel *friendDynamicModel8 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel8.dynamicImgArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8"];
    [self.friendDynamicDataSource addObject:friendDynamicModel8];
    CGFloat cellHeight8 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel8];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight8)];
    
    LYFriendDynamicModel *friendDynamicModel9 = [[LYFriendDynamicModel alloc] init];
    friendDynamicModel9.dynamicImgArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
    [self.friendDynamicDataSource addObject:friendDynamicModel9];
    CGFloat cellHeight9 = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel9];
    [self.friendDynamicCellHeightDataSource addObject:@(cellHeight9)];
//    for (int index = 0; index < 4; index ++)
//    {
//        LYFriendDynamicModel *friendDynamicModel = [[LYFriendDynamicModel alloc] init];
//        friendDynamicModel.dynamicImgArray = @[@"1", @"2", @"1", @"2"];
//        [self.friendDynamicDataSource addObject:friendDynamicModel];
//        
//        CGFloat cellHeight = [LYMainViewHeightManager mainCellHeightWithModel:friendDynamicModel];
//        [self.friendDynamicCellHeightDataSource addObject:@(cellHeight)];
//    }
}

/**
 *  @author liyong
 *
 *  初始化界面
 */
- (void)initView
{
    [super initView];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellReUseID];
    self.tableView.backgroundColor = UIColorFromRGB(0xececec);
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LYMainTableViewCell class]) bundle:nil] forCellReuseIdentifier:kMCTableViewCellReUseID];
    self.tableView.rowHeight = 237;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

/**
 *  @author liyong
 *
 *  自定义表头
 *
 *  @return
 */
- (UIView *)customTableHeaderView
{
    UIImageView *customTableHeaderView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.width, 200)];
    customTableHeaderView.image = [UIImage imageNamed:@"main_test.jpg"];
    
    return customTableHeaderView;
}

/**
 *  @author liyong
 *
 *  自定义表尾
 *
 *  @return
 */
- (UIView *)customTableFooterView
{
    UIView *customTableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    return customTableFooterView;
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.friendDynamicDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMCTableViewCellReUseID
                                                                forIndexPath:indexPath];
    if (indexPath.row < [self.friendDynamicDataSource count])
    {
        LYFriendDynamicModel *friendDynamicModel = [self.friendDynamicDataSource objectAtIndex:indexPath.row];
        [cell buildCellWithImgModel:friendDynamicModel];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < [self.friendDynamicCellHeightDataSource count])
    {
        NSNumber *cellHeight = [self.friendDynamicCellHeightDataSource objectAtIndex:indexPath.row];
        
        return [cellHeight floatValue];
    }
    
    return 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
