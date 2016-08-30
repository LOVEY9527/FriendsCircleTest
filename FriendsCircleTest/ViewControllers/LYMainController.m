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
    
    LYFriendDynamicModel *friendDynamicModel = [[LYFriendDynamicModel alloc] initWithDynamicContent:@""
                                                                                         ImageCount:0
                                                                                           zanCount:0
                                                                                      appraiseCount:0];
    [self.friendDynamicDataSource addObject:friendDynamicModel];
    
    LYFriendDynamicModel *friendDynamicModel1 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:1
                                                                                            zanCount:1
                                                                                       appraiseCount:1];
    [self.friendDynamicDataSource addObject:friendDynamicModel1];
    
    LYFriendDynamicModel *friendDynamicModel2 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:2
                                                                                            zanCount:2
                                                                                       appraiseCount:2];
    [self.friendDynamicDataSource addObject:friendDynamicModel2];
    
    LYFriendDynamicModel *friendDynamicModel3 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:3
                                                                                            zanCount:3
                                                                                       appraiseCount:3];
    [self.friendDynamicDataSource addObject:friendDynamicModel3];
    
    LYFriendDynamicModel *friendDynamicModel4 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:4
                                                                                            zanCount:4
                                                                                       appraiseCount:4];
    [self.friendDynamicDataSource addObject:friendDynamicModel4];
    
    LYFriendDynamicModel *friendDynamicModel5 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:5
                                                                                            zanCount:5
                                                                                       appraiseCount:5];
    [self.friendDynamicDataSource addObject:friendDynamicModel5];
    
    LYFriendDynamicModel *friendDynamicModel6 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:6
                                                                                            zanCount:6
                                                                                       appraiseCount:6];
    [self.friendDynamicDataSource addObject:friendDynamicModel6];
    
    LYFriendDynamicModel *friendDynamicModel7 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:7
                                                                                            zanCount:7
                                                                                       appraiseCount:7];
    [self.friendDynamicDataSource addObject:friendDynamicModel7];
    
    LYFriendDynamicModel *friendDynamicModel8 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:8
                                                                                            zanCount:8
                                                                                       appraiseCount:8];
    [self.friendDynamicDataSource addObject:friendDynamicModel8];
    
    LYFriendDynamicModel *friendDynamicModel9 = [[LYFriendDynamicModel alloc] initWithDynamicContent:@"你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？你有每天喝咖啡的习惯吗？"
                                                                                          ImageCount:9
                                                                                            zanCount:9
                                                                                       appraiseCount:9];
    [self.friendDynamicDataSource addObject:friendDynamicModel9];
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
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
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
    if (indexPath.row < [self.friendDynamicDataSource count])
    {
        LYFriendDynamicModel *friendDynamicModel = [self.friendDynamicDataSource objectAtIndex:indexPath.row];
        
        return friendDynamicModel.dynamicHeight + 40;
    }
    
    return 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
