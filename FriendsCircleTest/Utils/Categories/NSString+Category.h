//
//  NSString+Category.h
//  LQEachonline
//
//  Created by li_yong on 15/8/18.
//  Copyright (c) 2015年 luyongan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

/**
 *  @author liyong
 *
 *  获取字符串高度
 *
 *  @param defineWidth 默认宽度
 *  @param strFont     字体大小
 *
 *  @return
 */
- (CGFloat)strHeightWithDefineWidth:(CGFloat)defineWidth font:(UIFont *)strFont;

/**
 *  @author li_yong
 *
 *  获取字符串的宽度
 *
 *  @param defineHeight 默认高度
 *  @param strFont      字体大小
 *
 *  @return
 */
- (CGFloat)strWidthWithDefineHeight:(CGFloat)defineHeight font:(UIFont *)strFont;

/**
 *  @author li_yong
 *
 *  是否是合理的身份证号
 *  (中华人民共和国身份证规则：http://wenku.baidu.com/link?url=p_JbrFTwPTnc5rmPLoxQBaMypPV6tFLGW5hLGZYDks8pTJZNSNF9_VpAzeQVIKEtB6mhiZjkxbmFpW6khGd7b2Zo3gWQtxuwDKRXoY8DN2C)
 *
 *  @return
 */
- (BOOL)isValidateIDNumber;

/**
 *  md5加密
 *
 *  @return 返回加密后的string
 */
- (NSString *)convertToMD5;

/**
 *  判断当前字符串有没有为空或者只有空格字符串
 *
 *  @return bool yes代表有，no代表没有
 */
- (BOOL)isBlankString;

/**
 *  判断当前字符串有没有为空
 *
 *  @return bool yes代表有，no代表没有
 */
- (BOOL)isBlankReqString;

/**
 *  @author liyong
 *
 *  格式化手机号码，去掉区号(针对大陆区号+86，去掉手机号码中的“-”、“()”等非数字符号)
 */
- (NSString *)formatePhoneNum;

/**
 *  @author Lynn
 *
 *  判断电话号码
 *
 *  @return bool
 */
-(BOOL)checkPhoneNumInput;


/**
 *  @author Lynn
 *
 *  判断是否为中文
 *
 *  @return bool
 */
- (BOOL)checkChineseCharInput;

/**
 *  @author Lynn
 *
 *  1~15个中英文或数字
 *
 *  @return bool
 */
- (BOOL)checkChineseEnglishOrNumber;

/**
 *  @author liyong
 *
 *  判断一个字符是否是否是英文字母,不区分大小写
 *
 *  @return
 */
- (BOOL)checkEnglishLetter;

/**
 *  @author liyong
 *
 *  判断字符串是否全部为数字
 *
 *  @return 判断结果
 */
- (BOOL)isAllNum;

/**
 *  @author liyong
 *
 *  判断字符串是否全部为数字或者小数点
 *
 *  @return 判断结果
 */
- (BOOL)isNumAndPoint;

/**
 *  @author Lynn
 *
 *  获取解析过的deviceToken
 *
 *  @param deviceToken
 *
 *  @return deviceToken
 */
+ (NSString *)getDeviceToken:(NSData *)deviceToken;

/**
 *  @author li_yong
 *
 *  获取设备IP地址
 *
 *  @return IPAddress
 */
+ (NSString *)getIPAddress;

/**
 *  @author Lynn
 *
 *  汉字的拼音
 *
 *  @return 拼音
 */
- (NSString *)pinyin;

/**
 *  @author liyong
 *
 *  json字符串解析
 *
 *  @return 解析结果(字典或者数组)
 */
- (id)jsonStrParse;

/**
 *  @author liyong
 *
 *  字典/数组转化为json字符串
 *
 *  @param dic 字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStringWithDictionary:(id)obj;

/**
 *  @author Lynn
 *
 *  文件格式
 *
 *  @param filename filename description
 *
 *  @return return value description
 */
+ (NSString*)GetContentType:(NSString*)filename;

/**
 *  @author Lynn
 *
 *  IM时间格式
 *
 *  @param secs secs description
 *
 *  @return return value description
 */
+ (NSString *)ConvertMessageTime:(long long)secs;

@end
