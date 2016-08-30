//
//  LYAppraiseTextField.m
//  FriendsCircleTest
//
//  Created by li_yong on 16/8/22.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import "LYAppraiseTextField.h"

//视图高度
CGFloat const kATFHeight = 40;

@interface LYAppraiseTextField()<UITextFieldDelegate>

@property (assign, nonatomic) id<LYAppraiseTextFieldDelegate> delegate;

//输入框动画时间
@property (assign, nonatomic) CGFloat animationDuring;

//输入框
@property (strong, nonatomic) UITextField *textField;

@end

@implementation LYAppraiseTextField

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
                                               containView:(UIView *)containSuperView
{
    LYAppraiseTextField *appraiseTextField = [[LYAppraiseTextField alloc] initWithFrame:CGRectMake(0, App_Frame_Height - 40, App_Frame_Width, 40)];
    appraiseTextField.delegate = delegate;
    [appraiseTextField show];
    [containSuperView addSubview:appraiseTextField];
    
    return appraiseTextField;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  @author li_yong
 *
 *  初始化接口
 *
 *  @param frame 尺寸大小
 *
 *  @return
 */
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //监听键盘弹出通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyBoardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        //监听键盘消失通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyBoardWillDisappear:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
        [self buildView];
    }
    
    return self;
}

/**
 *  @author li_yong
 *
 *  监听键盘弹出通知
 *
 *  @param notification 通知
 */
- (void)keyBoardWillShow:(NSNotification *)notification
{
    if ([[notification.userInfo allKeys] containsObject:UIKeyboardAnimationDurationUserInfoKey] &&
        [[notification.userInfo allKeys] containsObject:UIKeyboardFrameEndUserInfoKey])
    {
        //键盘弹出动画的时间间隔
        self.animationDuring = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        //键盘弹出结束的位置
        CGRect endRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        
        [UIView animateWithDuration:self.animationDuring
                         animations:^{
                             self.top = endRect.origin.y - kATFHeight;
                         }];
    }
}

/**
 *  @author li_yong
 *
 *  监听键盘消失通知
 *
 *  @param notification 通知
 */
- (void)keyBoardWillDisappear:(NSNotification *)notification
{
    if ([[notification.userInfo allKeys] containsObject:UIKeyboardAnimationDurationUserInfoKey] &&
        [[notification.userInfo allKeys] containsObject:UIKeyboardFrameEndUserInfoKey])
    {
        //键盘弹出动画的时间间隔
        self.animationDuring = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        
        [UIView animateWithDuration:self.animationDuring
                         animations:^{
                             self.top = App_Frame_Height;
                         } completion:^(BOOL finished) {
                             if (finished)
                             {
                                 [self removeFromSuperview];
                             }
                         }];
    }
}

/**
 *  @author li_yong
 *
 *  绘制界面
 */
- (void)buildView
{
    self.backgroundColor = UIColorFromRGB(0xECECEC);
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 5, self.width - 30, 30)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.font = [UIFont systemFontOfSize:14];
    self.textField.placeholder = @"评论";
    self.textField.returnKeyType = UIReturnKeySend;
    self.textField.delegate = self;
    [self addSubview:self.textField];
}

/**
 *  @author li_yong
 *
 *  显示
 */
- (void)show
{
    [self.textField becomeFirstResponder];
}

/**
 *  @author li_yong
 *
 *  隐藏
 */
- (void)dismiss
{
    [self.textField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self dismiss];
    
    if ([self.delegate respondsToSelector:@selector(appraiseTextField:didReturnWithText:)])
    {
        [self.delegate appraiseTextField:self didReturnWithText:textField.text];
    }
    
    return YES;
}

@end
