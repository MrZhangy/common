//
//  Common.h
//  ShouGongKe
//
//  Created by zhangyafeng on 15/4/25.
//  Copyright (c) 2015年 ZYF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface Common : NSObject

#pragma mark UIView
/**切割view为圆形*/
+(UIView *)circularView:(UIView *)imageView;

/**得到当前view的ViewController*/
+ (UIViewController *)viewControllerWithView:(UIView*)view;

#pragma mark UIImageView
/**每次都重新创建image 默认类型png, 指定其他类型替换*/
+(UIImage *)imageWithName:(NSString*)name type:(NSString *)type;


#pragma mark 字节转换
+(NSString*)sizeOfByte:(long long)byte;


#pragma mark 沙盒目录
/**Get path of Documents directory.*/
+ (NSString *)documentsPath;

/**Get path of Library directory.*/
+ (NSString *)libraryPath;

/**Get path of Caches directory.*/
+ (NSString *)cachesPath;

#pragma mark 计算文件,目录大小
/**得到指定文件的大小*/
+(NSString*)sizeOfFile:(NSString*)file;

/**返回指定文件夹的大小，单位KB, MB, TB自动切换*/
+(NSString*)sizeOfFolder:(NSString *)folderPath;

@end
