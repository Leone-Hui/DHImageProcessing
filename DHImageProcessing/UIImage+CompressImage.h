//
//  UIImage+CompressImage.h
//  DHImageProcessing
//
//  Created by npkj on 2017/3/14.
//  Copyright © 2017年 npkj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIImage JPEGImage;
typedef UIImage PNGImage;
typedef NSData JPEGData;
typedef NSData PNGData;

@interface UIImage (CompressImage)


/**
 *  传入图片,需要的大小,比例,得到压缩图片大小
 *
 *      @prama image 需要压缩的图片
 *      @prama size  压缩后图片的大小
 *      @prama scale 压缩的比例 0.0 - 1.0
 *
 *      @return 返回新的图片
 */
+ (JPEGImage *)needCompressImage:(UIImage *)image size:(CGSize )size scale:(CGFloat )scale;
+ (JPEGImage *)needCompressImageData:(NSData *)imageData size:(CGSize )size scale:(CGFloat )scale;

/**
 *  传入图片,获取中间部分,需要的大小,压缩比例
 *
 *      @prama image 需要压缩的图片
 *      @prama size  压缩后图片的大小
 *      @prama scale 压缩的比例 0.0 - 1.0
 *
 *      @return 返回新的图片
 */
+ (JPEGImage *)needCenterImage:(UIImage *)image size:(CGSize )size scale:(CGFloat )scale;


/**
 *  png图片转为jpeg(jpg)图片
 *
 *      @prama image 需要转为jpeg的png图片
 *
 *      @return 返回一张jpeg图片
 */
+ (JPEGImage *)jpegImageWithPNGImage:(PNGImage *)pngImage;

/**
 Png格式图片数据装换为jpeg图片

 @param pngData png格式图片数据
 @return JPEG图片
 */
+ (JPEGImage *)jpegImageWithPNGData:(PNGData *)pngData;


/**
 Description

 @param pngData pngData description
 @return return value description
 */
+ (JPEGData *)jpegDataWithPNGData:(PNGData *)pngData;

/**
 Description

 @param pngImage pngImage description
 @return return value description
 */
+ (JPEGData *)jpegDataWithPNGImage:(PNGImage *)pngImage;

+(UIImage*)imageWithImage:(UIImage*)sourceImage scaledToSizeWithscaledToSize:(CGSize)targetSize;


/**
 *  对图片进行压缩-指定最最大值
 *
 *  @param length length description
 *  @param image  image description
 *
 *  @return return value description
 */
+ (UIImage *)imageWithMaxSide:(CGFloat)length sourceImage:(UIImage *)image;

@end
