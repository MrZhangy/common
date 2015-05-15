//
//  Common.m
//  ShouGongKe
//
//  Created by zhangyafeng on 15/4/25.
//  Copyright (c) 2015年 ZYF. All rights reserved.
//

#import "Common.h"

@implementation Common

#pragma mark UIView
+(UIView *)circularView:(UIView *)imageView
{
    imageView.layer.cornerRadius = CGRectGetWidth(imageView.frame)/2;
    imageView.layer.masksToBounds = YES;
    return imageView;
}


/**得到当前view的ViewController*/
+ (UIViewController *)viewControllerWithView:(UIView*)view {
    for (UIView* next = view; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma UIImageView
+(UIImage *)imageWithName:(NSString*)name type:(NSString *)type
{
    NSString *nowtype = @"png";
    if(type != nil) {
        nowtype = type;
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nowtype];
    UIImage *image  = [UIImage imageWithContentsOfFile:path];
    return image;
}


#pragma mark 字节转换
+(NSString*)sizeOfByte:(long long)folderSize
{
    NSString *sizeType = @"bytes";
    if(folderSize<1){
        return @"Size: Zero KB";
    }else{
        if (folderSize > 1024)
        {
            //Kilobytes
            folderSize = folderSize / 1024;
            
            sizeType = @" KB";
        }
        
        if (folderSize > 1024)
        {
            //Megabytes
            folderSize = folderSize / 1024;
            
            sizeType = @" MB";
        }
        
        if (folderSize > 1024)
        {
            //Gigabytes
            folderSize = folderSize / 1024;
            
            sizeType = @" GB";
        }
        
        return [NSString stringWithFormat:@"%llu%@",folderSize,sizeType];
    }
}

#pragma mark 沙盒目录
+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}
+ (NSString *)documentsPath
{
    return [self pathForDirectory:NSDocumentDirectory];
}

+ (NSString *)libraryPath
{
    return [self pathForDirectory:NSLibraryDirectory];
}

+ (NSString *)cachesPath
{
    return [self pathForDirectory:NSCachesDirectory];
}

+ (unsigned long long int)folderSize:(NSString *)folderPath {
    
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    NSString *fileName;
    unsigned long long int fileSize = 0;
    
    while (fileName = [filesEnumerator nextObject]) {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        fileSize += [fileDictionary fileSize];
    }
    

    
    return fileSize;
    
}

+ (NSString *)byteSizeOfFolder:(NSString *)folderPath
{
    
    unsigned long long int folderSize = 0;
    folderSize = [self folderSize:folderPath];
    
    //This line will give you formatted size from bytes ....
    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:folderSize countStyle:NSByteCountFormatterCountStyleFile];
    return [NSString stringWithFormat:@"%@ KB",folderSizeStr];
}

/**得到指定文件的大小*/
+(NSString*)sizeOfFile:(NSString*)filePath
{
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    NSInteger fileSize = [[fileAttributes objectForKey:NSFileSize] integerValue];
    NSString *fileSizeStr = [NSByteCountFormatter stringFromByteCount:fileSize countStyle:NSByteCountFormatterCountStyleFile];
    return fileSizeStr;
    /*
     
     unsigned long long fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:someFilePath error:nil] fileSize];
     NSString *size = [NSString stringWithFormat:@"%llu",fileSize];
     return size;
     */
}

+ (NSString*)sizeOfFolder:(NSString *)folderPath
{
    unsigned long long int folderSize = [self folderSize:folderPath];
    return [self sizeOfByte:folderSize];
}

@end
