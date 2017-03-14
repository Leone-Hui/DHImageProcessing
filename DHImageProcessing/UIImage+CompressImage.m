//
//  UIImage+CompressImage.m
//  DHImageProcessing
//
//  Created by npkj on 2017/3/14.
//  Copyright © 2017年 npkj. All rights reserved.
//

#import "UIImage+CompressImage.h"

@implementation UIImage (CompressImage)
+(JPEGImage *)needCompressImage:(UIImage *)image size:(CGSize )size scale:(CGFloat )scale
{
    JPEGImage *newImage = nil;
    //创建画板
    UIGraphicsBeginImageContext(size);
    //写入图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //得到新的图片
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    //释放画板
    UIGraphicsEndImageContext();
    //比例压缩
    newImage = [UIImage imageWithData:UIImageJPEGRepresentation(newImage, scale)];
    //    newImage = [UIImage imageWithData:UIImageJPEGRepresentation(newImage, 1.0) scale:scale];
    
    return newImage;
}

+(JPEGImage *)needCompressImageData:(NSData *)imageData size:(CGSize )size scale:(CGFloat )scale
{
    PNGImage *image = [UIImage imageWithData:imageData];
    return [UIImage needCompressImage:image size:size scale:scale];
}

+ (JPEGImage *)needCenterImage:(UIImage *)image size:(CGSize )size scale:(CGFloat )scale
{
    /* 想切中间部分,待解决 */
#warning area of center image
    JPEGImage *newImage = nil;
    //创建画板
    UIGraphicsBeginImageContext(size);
    
    //写入图片,在中间
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //得到新的图片
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //释放画板
    UIGraphicsEndImageContext();
    
    //比例压缩
    newImage = [UIImage imageWithData:UIImageJPEGRepresentation(newImage, scale)];
    
    return newImage;
}

+(JPEGImage *)jpegImageWithPNGImage:(PNGImage *)pngImage
{
    return [UIImage needCompressImage:pngImage size:pngImage.size scale:1.0];
}

+(JPEGImage *)jpegImageWithPNGData:(PNGData *)pngData
{
    PNGImage *pngImage = [UIImage imageWithData:pngData];
    return [UIImage needCompressImage:pngImage size:pngImage.size scale:1.0];
}

+(JPEGData *)jpegDataWithPNGData:(PNGData *)pngData
{
    return UIImageJPEGRepresentation([UIImage jpegImageWithPNGData:pngData], 1.0);
}

+(JPEGData *)jpegDataWithPNGImage:(PNGImage *)pngImage
{
    return UIImageJPEGRepresentation([UIImage jpegImageWithPNGImage:pngImage], 1.0);
}
/**
 *  对图片进行压缩-指定最最大值
 *
 *  @param length length description
 *  @param image  image description
 *
 *  @return return value description
 */
+ (UIImage *)imageWithMaxSide:(CGFloat)length sourceImage:(UIImage *)image{
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGSize imgSize = CWSizeReduce(image.size, length);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, scale);  // 创建一个 bitmap context
    
    [image drawInRect:CGRectMake(0, 0, imgSize.width, imgSize.height)
            blendMode:kCGBlendModeNormal alpha:1.0];              // 将图片绘制到当前的 context 上
    
    img = UIGraphicsGetImageFromCurrentImageContext();            // 从当前 context 中获取刚绘制的图片
    UIGraphicsEndImageContext();
    
    return img;
}
static inline CGSize CWSizeReduce(CGSize size, CGFloat limit) // 按比例减少尺寸
{
    CGFloat max = MAX(size.width, size.height);
    if (max < limit) {
        return size;
    }
    
    CGSize imgSize;
    CGFloat ratio = size.height / size.width;
    
    if (size.width > size.height) {
        imgSize = CGSizeMake(limit, limit*ratio);
    } else {
        imgSize = CGSizeMake(limit/ratio, limit);
    }
    
    return imgSize;
}


@end
