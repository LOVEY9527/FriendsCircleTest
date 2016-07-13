//
//  LQMacro.h
//  LQEachOnline
//
//  Created by heji on 15/11/12.
//  Copyright © 2015年 luyongan. All rights reserved.
//

/***************************************************************************************
 ***************************            设备屏幕尺寸            **************************
 ***************************************************************************************
 */

/**
 *  是否是retina
 */
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  是否是iPhone5
 */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  是否是iPhone6
 */
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  是否是iPhone6Plus
 */
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  是否是ipad
 */
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 *  屏幕高度
 */
#define App_Frame_Height        [[UIScreen mainScreen] bounds].size.height

/**
 *  屏幕宽度
 */
#define App_Frame_Width         [[UIScreen mainScreen] bounds].size.width

/**
 *  状态栏高度
 */
#define kStatusHeight           (20.f)

/**
 *  导航栏+状态栏高度
 */
#define kNavbarAndStatusBar     (64.f)

/**
 *  导航栏高度
 */
#define kTopBarHeight           (44.f)

/**
 *  tabbar高度
 */
#define kBottomBarHeight        (49.f)

/**
 *  英文键盘高度
 */
#define kEnglishKeyboardHeight  (252.f)//(216.f)

/**
 *  中文键盘高度
 */
#define kChineseKeyboardHeight  (252.f)

/***************************************************************************************
 ***************************            设备系统版本            **************************
 ***************************************************************************************
 */

/**
 *  IOS版本
 */
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

/**
 *  是否是IOS5
 */
#define isIOS5 ([[[UIDevice currentDevice] systemVersion] intValue]==5)

/**
 *  是否是IOS6
 */
#define isIOS6 ([[[UIDevice currentDevice] systemVersion] intValue]==6)

/**
 *  是否是IOS7
 */
#define isIOS7 ([[[UIDevice currentDevice] systemVersion] intValue]==7)

/**
 *  是否是IOS8
 */
#define isIOS8 ([[[UIDevice currentDevice] systemVersion] intValue]==8)

/**
 *  是否是IOS9
 */
#define isIOS9 ([[[UIDevice currentDevice] systemVersion] intValue]==9)

/**
 *  版本是否高于IOS5
 */
#define isAfterIOS5 ([[[UIDevice currentDevice] systemVersion] intValue]>5)

/**
 *  版本是否高于IOS6
 */
#define isAfterIOS6 ([[[UIDevice currentDevice] systemVersion] intValue]>6)

/**
 *  版本是否高于IOS7
 */
#define isAfterIOS7 ([[[UIDevice currentDevice] systemVersion] intValue]>7)

/**
 *  版本是否高于IOS8
 */
#define isAfterIOS8 ([[[UIDevice currentDevice] systemVersion] intValue]>8)


/***************************************************************************************
 ***************************            设备当前语言            **************************
 ***************************************************************************************
 */

/**
 *  设备当前语言
 */
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])



/***************************************************************************************
 ***************************            图片相关宏            ****************************
 ***************************************************************************************
 */

/**
 *  读取本地图片
 */
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

/**
 *  读取本地PNG图片
 */
#define LOADPNGIMAGE(file) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:@"png"]]

/**
 *  定义UIImage对象
 */
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

/**
 *  定义UIImage对象,但性能差于前两个方法,考虑因素--是否要进行缓存
 */
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]

/**
 *  拉伸图片
 */
#define ResizableImage(name,top,left,bottom,right) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right)]

#define ResizableImageWithMode(name,top,left,bottom,right,mode) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right) resizingMode:mode]



/***************************************************************************************
 ***************************            颜色相关宏            ****************************
 ***************************************************************************************
 */

/**
 *  rgb颜色转换（16进制->10进制）
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**
 *  获取RGB颜色
 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)




/***************************************************************************************
 ***************************            OTHERS            ******************************
 ***************************************************************************************
 */

/**
 *  读取文件的文本内容,默认编码为UTF-8
 *
 *  @param name 文件名
 *  @param ext  格式
 *
 *  @return
 */
#define FileString(name,ext)            [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)] encoding:NSUTF8StringEncoding error:nil]

#define FileDictionary(name,ext)        [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]

#define FileArray(name,ext)             [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]

/**
 *  GCD
 */
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)



/***************************************************************************************
 ***************************            View相关            *****************************
 ***************************************************************************************
 */

/**
 *  设置需要粘贴的文字或图片
 */
#define PasteString(string)   [[UIPasteboard generalPasteboard] setString:string];
#define PasteImage(image)     [[UIPasteboard generalPasteboard] setImage:image];

/**
 *  得到视图的left top的X,Y坐标点
 */
#define VIEW_TX(view) (view.frame.origin.x)
#define VIEW_TY(view) (view.frame.origin.y)

/**
 *  得到视图的right bottom的X,Y坐标点
 */
#define VIEW_BX(view) (view.frame.origin.x + view.frame.size.width)
#define VIEW_BY(view) (view.frame.origin.y + view.frame.size.height )

/**
 *  得到视图的尺寸:宽度、高度
 */
#define VIEW_W(view)  (view.frame.size.width)
#define VIEW_H(view)  (view.frame.size.height)

/**
 *  得到frame的X,Y坐标点
 */
#define FRAME_TX(frame)  (frame.origin.x)
#define FRAME_TY(frame)  (frame.origin.y)

/**
 *  得到frame的宽度、高度
 */
#define FRAME_W(frame)  (frame.size.width)
#define FRAME_H(frame)  (frame.size.height)



/***************************************************************************************
 ***************************            LOG输出            ******************************
 ***************************************************************************************
 */

/**
 *  Debug模式下打印日志,当前行,函数名
 *
 *  @param FORMAT
 *  @param ...
 *
 *  @return LOG
 */
//#if DEBUG
#define DLog(FORMAT, ...) fprintf(stderr,"\nFunction:%s Line:%d Content:\n ===================>>\n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(FORMAT, ...) nil
//#endif

/**
 *  Debug模式下打印日志,当前行,函数名 并弹出一个警告
 *
 *  @param fmt
 *  @param ... ...
 *
 *  @return LOG
 */
#ifdef DEBUG
#define  WDLog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#define NSLog(...)
#endif


/**
 * 打印Frame
 */
#define LogFrame(frame) NSLog(@"frame[X=%.1f,Y=%.1f,W=%.1f,H=%.1f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)

/**
 * 打印Point
 */
#define LogPoint(point) NSLog(@"Point[X=%.1f,Y=%.1f]",point.x,point.y)

//#ifdef DEBUG

#define po(obj)       NSLog(@"%@", obj)

#define pi(var_i)     NSLog(@"%d", var_i)

#define pf(var_f)     NSLog(@"%f", var_f)

#define LogFunc()      NSLog(@"%s", __PRETTY_FUNCTION__)
