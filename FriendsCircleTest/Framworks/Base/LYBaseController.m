//
//  LYBaseController.m
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/12.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYBaseController.h"

@interface LYBaseController ()

@end

@implementation LYBaseController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化数据源
    [self initDataSource];
    //初始化导航栏
    [self initNav];
    //初始化界面
    [self initView];
}

/**
 *  @author liyong
 *
 *  初始化数据源
 */
- (void)initDataSource
{
    
}

/**
 *  @author liyong
 *
 *  初始化导航栏
 */
- (void)initNav
{
    
}

/**
 *  @author liyong
 *
 *  初始化界面
 */
- (void)initView
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
