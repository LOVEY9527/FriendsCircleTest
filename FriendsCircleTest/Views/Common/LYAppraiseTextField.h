//
//  LYAppraiseTextField.h
//  FriendsCircleTest
//
//  Created by li_yong on 16/8/22.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYAppraiseTextFieldDelegate;

@interface LYAppraiseTextField : UIView

/**
 *  @author li_yong
 *
 *  弹出评论输入框
 *
 *  @param delegate         代理
 *  @param containSuperView 存放输入框的容器视图
 */
+ (void)showAppraiseTextFieldWithDelegate:(id<LYAppraiseTextFieldDelegate>)delegate
                              containView:(UIView *)containSuperView;

@end
