//
//  LYBaseTableController.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/12.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYBaseTableController : UITableViewController

/**
 *  @author liyong
 *
 *  初始化数据源
 */
- (void)initDataSource;

/**
 *  @author liyong
 *
 *  初始化导航栏
 */
- (void)initNav;

/**
 *  @author liyong
 *
 *  初始化界面
 */
- (void)initView;

/**
 *  @author liyong
 *
 *  自定义表头
 *
 *  @return
 */
- (UIView *)customTableHeaderView;

/**
 *  @author liyong
 *
 *  自定义表尾
 *
 *  @return
 */
- (UIView *)customTableFooterView;

@end
