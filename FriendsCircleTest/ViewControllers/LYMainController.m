//
//  LYMainController.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/12.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYMainController.h"
#import "LYMainTableViewCell.h"

static NSString *tableViewCellReUseID = @"tableViewCellReUseID";

@interface LYMainController ()

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
 *  初始化界面
 */
- (void)initView
{
    [super initView];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellReUseID];
    self.tableView.backgroundColor = UIColorFromRGB(0xececec);
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LYMainTableViewCell class]) bundle:nil] forCellReuseIdentifier:tableViewCellReUseID];
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellReUseID
                                                                forIndexPath:indexPath];
//    cell.textLabel.text = @"123";
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
