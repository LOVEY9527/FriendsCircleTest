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
 *  显示输入框
 *
 *  @param delegate         代理
 *  @param containSuperView 容器视图
 *
 *  @return
 */
+ (LYAppraiseTextField *)showAppraiseTextFieldWithDelegate:(id<LYAppraiseTextFieldDelegate>)delegate
                                               containView:(UIView *)containSuperView;

/**
 *  @author li_yong
 *
 *  隐藏
 */
- (void)dismiss;

@end

@protocol LYAppraiseTextFieldDelegate <NSObject>

@optional

- (void)appraiseTextField:(LYAppraiseTextField *)appraiseTextField didReturnWithText:(NSString *)text;

@end
