//
//  LYFriendDynamicModel.h
//  FriendsCircleTest
//
//  Created by 李勇 on 16/7/14.
//  Copyright © 2016年 李勇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYFriendDynamicModel : NSObject

//动态内容
@property (copy, nonatomic) NSString *dynamicContent;
//动态图片数组
@property (strong, nonatomic) NSArray *dynamicImgArray;

@end
