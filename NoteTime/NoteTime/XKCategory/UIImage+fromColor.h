//
//  UIImage+fromColor.h
//  猿题库
//
//  Created by xukai on 16/4/13.
//  Copyright (c) 2016年 King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (fromColor)

/** 创建一个颜色为指定颜色的 UIImage */
+ (UIImage *)createImageWithColor:(UIColor *)color rect:(CGRect)rect;

/** 
 *  从图像中取出某一点的颜色(注意给定坐标应该是根据图片尺寸计算的)
 *  point.x = pointX/ImageView.width * ImageView.image.width
 *  point.y = pointY/ImageView.height* ImageView.image.height
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

@end
