//
//  NSString+Category.m
//  LQEachonline
//
//  Created by li_yong on 15/8/18.
//  Copyright (c) 2015年 luyongan. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
@implementation NSString (Category)

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
- (CGFloat)strHeightWithDefineWidth:(CGFloat)defineWidth font:(UIFont *)strFont
{
    CGFloat strHeight;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0)
    {
        strHeight = [self boundingRectWithSize:CGSizeMake(defineWidth, MAXFLOAT)
                                       options: NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName:strFont}
                                       context:nil].size.height;
    }else
    {
        strHeight = [self sizeWithFont:strFont
                          constrainedToSize:CGSizeMake(defineWidth, MAXFLOAT)
                          lineBreakMode:NSLineBreakByWordWrapping].height;
    }
    
    return strHeight;
}

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
- (CGFloat)strWidthWithDefineHeight:(CGFloat)defineHeight font:(UIFont *)strFont
{
    CGRect stringRect;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0)
    {
        stringRect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, defineHeight)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:strFont}
                                        context:nil];
    }else
    {
        CGSize stringSize = [self sizeWithFont:strFont
                             constrainedToSize:CGSizeMake(MAXFLOAT, defineHeight)
                                 lineBreakMode:NSLineBreakByWordWrapping];
        stringRect = CGRectMake(0, 0, stringSize.width, stringSize.height);
    }
    
    return stringRect.size.width;
}

- (BOOL)isValidateIDNumber
{
    NSString *value = self;
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSUInteger length = 0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        if (length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    NSString *valueStart2 = [value substringToIndex:2];
    
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    if (!areaFlag) {
        return false;
    }
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    int year =0;
    year = [value substringWithRange:NSMakeRange(6,4)].intValue;
    if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
        regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                options:NSRegularExpressionCaseInsensitive
                                                                  error:nil];//测试出生日期的合法性
    }else {
        regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                options:NSRegularExpressionCaseInsensitive
                                                                  error:nil];//测试出生日期的合法性
    }
    numberofMatch = [regularExpression numberOfMatchesInString:value
                                                       options:NSMatchingReportProgress
                                                         range:NSMakeRange(0, value.length)];
    if(numberofMatch >0) {
        int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
        int Y = S %11;
        NSString *M =@"F";
        NSString *JYM =@"10X98765432";
        M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
        if ([M isEqualToString:[[value uppercaseString] substringWithRange:NSMakeRange(17,1)]]) {
            return YES;// 检测ID的校验位
        }else {
            return NO;
        }
    }else {
        return NO;
    }
}


- (NSString *)convertToMD5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

/**
 *  判断当前字符串有没有为空或者只有空格字符串
 *
 *  @return bool yes代表有，no代表没有
 */
- (BOOL)isBlankString {
    if (self == nil){
        return YES;
    }
    if (self == NULL){
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]){
        return YES;
    }
    if ([self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        return YES;
    }
    return NO;
}

/**
 *  判断当前字符串有没有为空
 *
 *  @return bool yes代表有，no代表没有
 */
- (BOOL)isBlankReqString {
    if (self == nil){
        return YES;
    }
    if (self == NULL){
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]){
        return YES;
    }
    return NO;
}

/**
 *  @author liyong
 *
 *  格式化手机号码，去掉区号(针对大陆区号+86，去掉手机号码中的“-”、“()”等非数字符号)
 */
- (NSString *)formatePhoneNum
{
    NSString *formatePhoneNum = self;
    if ([self hasPrefix:@"86"])
    {
        formatePhoneNum = [self substringWithRange:NSMakeRange(2, [self length]-2)];
    }
    else if ([self hasPrefix:@"+86"])
    {
        if ([self hasPrefix:@"+86·"])
        {
            formatePhoneNum = [self substringWithRange:NSMakeRange(4, [self length]-4)];
        }else {
            formatePhoneNum = [self substringWithRange:NSMakeRange(3, [self length]-3)];
        }
    }
    
    if (![formatePhoneNum isAllNum])
    {
        NSString *formatePhoneNum1 = @"";
        unichar c;
        for (int i = 0; i < formatePhoneNum.length; i++)
        {
            c = [formatePhoneNum characterAtIndex:i];
            if (isdigit(c))
            {
                formatePhoneNum1 = [formatePhoneNum1 stringByAppendingString:[NSString stringWithFormat:@"%c", c]];
            }
        }
        
        return formatePhoneNum1;
    }
    
    return formatePhoneNum;
}

/**
 *  @author Lynn
 *
 *  判断电话号码
 *
 *  @return bool
 */
-(BOOL)checkPhoneNumInput{
    
    NSString *CM = @"^(13|14|15|17|18)\\d{9}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    BOOL res2 = [regextestcm evaluateWithObject:self];
    
    if (res2 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
/**
 *  @author Lynn
 *
 *  中文
 *
 *  @return bool
 */
- (BOOL)checkChineseCharInput
{
    NSString *CM = @"^[\u4E00-\u9FA5]*$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    BOOL res2 = [regextestcm evaluateWithObject:self];
    
    if (res2 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 *  @author Lynn
 *
 *  1~15个中英文或数字
 *
 *  @return bool
 */
- (BOOL)checkChineseEnglishOrNumber
{
    NSString *CM = @"^[\u4e00-\u9fffa-zA-Z0-9]{1,15}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    BOOL res2 = [regextestcm evaluateWithObject:self];
    
    if (res2 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 *  @author liyong
 *
 *  判断一个字符是否是否是英文字母,不区分大小写
 *
 *  @return
 */
- (BOOL)checkEnglishLetter
{
    NSString *CM = @"[a-zA-Z]";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    BOOL res2 = [regextestcm evaluateWithObject:self];
    if (res2 )
    {
        return YES;
    }else
    {
        return NO;
    }
}

/**
 *  @author liyong
 *
 *  判断字符串是否全部为数字
 *
 *  @return 判断结果
 */
- (BOOL)isAllNum
{
    unichar c;
    for (int i=0; i<self.length; i++)
    {
        c = [self characterAtIndex:i];
        if (!isdigit(c))
        {
            return NO;
        }
    }
    return YES;
}

/**
 *  @author liyong
 *
 *  判断字符串是否全部为数字或者小数点
 *
 *  @return 判断结果
 */
- (BOOL)isNumAndPoint
{
    unichar c;
    for (int i=0; i<self.length; i++)
    {
        c = [self characterAtIndex:i];
        if ((!isdigit(c)) && (c != '.'))
        {
            return NO;
        }
    }
    return YES;
}

/**
 *  @author Lynn
 *
 *  获取解析过的deviceToken
 *
 *  @param deviceToken
 *
 *  @return deviceToken
 */
+ (NSString *)getDeviceToken:(NSData *)deviceToken
{
    return [[[[NSString stringWithFormat:@"%@",deviceToken]
              stringByReplacingOccurrencesOfString:@"<" withString:@""]
             stringByReplacingOccurrencesOfString:@">" withString:@""]
            stringByReplacingOccurrencesOfString:@" " withString:@""];
}



// Get IP Address
+ (NSString *)getIPAddress {
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);  
    
//    NSLog(@"手机的IP是：%@", address);
    return address;
}

//汉字的拼音
- (NSString *)pinyin{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform(( CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/**
 *  @author liyong
 *
 *  json字符串解析
 *
 *  @return 解析结果(字典或者数组)
 */
- (id)jsonStrParse
{
    if ([self length] <= 0)
    {
        return nil;
    }
    
    NSError *err;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    id parseResult = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:&err];
    if (err)
    {
        NSLog(@"解析失败:%@", self);
        return nil;
    }
    return parseResult;
}

/**
 *  @author liyong
 *
 *  字典/数组转化为json字符串
 *
 *  @param dic 字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStringWithDictionary:(id)obj
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:0
                                                         error:&parseError];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}

/**
 *  @author Lynn
 *
 *  文件格式
 *
 *  @param filename filename description
 *
 *  @return return value description
 */
+ (NSString*)GetContentType:(NSString*)filename{
    if ([filename hasSuffix:@".avi"]) {
        return @"video/avi";
    }
    else if([filename hasSuffix:@".bmp"])
    {
        return @"application/x-bmp";
    }
    else if([filename hasSuffix:@"jpeg"])
    {
        return @"image/jpeg";
    }
    else if([filename hasSuffix:@"jpg"])
    {
        return @"image/jpeg";
    }
    else if([filename hasSuffix:@"png"])
    {
        return @"image/x-png";
    }
    else if([filename hasSuffix:@"mp3"])
    {
        return @"audio/mp3";
    }
    else if([filename hasSuffix:@"mp4"])
    {
        return @"video/mpeg4";
    }
    else if([filename hasSuffix:@"rmvb"])
    {
        return @"application/vnd.rn-realmedia-vbr";
    }
    else if([filename hasSuffix:@"txt"])
    {
        return @"text/plain";
    }
    else if([filename hasSuffix:@"xsl"])
    {
        return @"application/x-xls";
    }
    else if([filename hasSuffix:@"xslx"])
    {
        return @"application/x-xls";
    }
    else if([filename hasSuffix:@"xwd"])
    {
        return @"application/x-xwd";
    }
    else if([filename hasSuffix:@"doc"])
    {
        return @"application/msword";
    }
    else if([filename hasSuffix:@"docx"])
    {
        return @"application/msword";
    }
    else if([filename hasSuffix:@"ppt"])
    {
        return @"application/x-ppt";
    }
    else if([filename hasSuffix:@"pdf"])
    {
        return @"application/pdf";
    }
    return @"application/octet-stream";
}

/**
 *  @author Lynn
 *
 *  IM时间格式
 *
 *  @param secs secs description
 *
 *  @return return value description
 */
+ (NSString *)ConvertMessageTime:(long long)secs
{
    NSString *timeText = nil;
    
    NSDate *messageDate = [NSDate dateWithTimeIntervalSince1970:secs];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *strMsgDay = [formatter stringFromDate:messageDate];
    
    NSDate *now = [NSDate date];
    NSString *strToday = [formatter stringFromDate:now];
    NSDate *yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-(24 * 60 * 60)];
    NSString *strYesterday = [formatter stringFromDate:yesterday];
    
    NSString *_yesterday = nil;
    if ([strMsgDay isEqualToString:strToday]) {
        [formatter setDateFormat:@"HH':'mm"];
    } else if ([strMsgDay isEqualToString:strYesterday]) {
        _yesterday = NSLocalizedStringFromTable(@"Yesterday", @"RongCloudKit", nil);
    }
    
    if (nil != _yesterday) {
        timeText = _yesterday; //[_yesterday stringByAppendingFormat:@" %@", timeText];
    } else {
        timeText = [formatter stringFromDate:messageDate];
    }
    
    return timeText;
}

@end
