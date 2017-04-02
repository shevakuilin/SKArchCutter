//
//  SKArchCutter.h
//  SKArchCutter
//
//  Created by shevchenko on 17/3/28.
//  Copyright © 2017年 shevchenko. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SKArchCutter : NSObject

/** 切割UIView、UIButton和UILabel圆角
 * @param view 需要进行切割的对象
 * @param direction 切割的方向
 * @param cornerRadii 圆角半径
 * @param borderWidth 边框宽度
 * @param borderColor 边框颜色
 * @param backgroundColor 背景色
 */
+ (void)cuttingView:(UIView *)view cuttingDirection:(UIRectCorner)direction cornerRadii:(CGFloat)cornerRadii borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor;

/** 切割UIImageView圆角
 * @param imageView 需要进行切割的对象
 * @param direction 切割的方向
 * @param cornerRadii 圆角半径
 * @param borderWidth 边框宽度
 * @param borderColor 边框颜色
 * @param backgroundColor 背景色
 */
+ (void)cuttingImageView:(UIImageView *)imageView cuttingDirection:(UIRectCorner)direction cornerRadii:(CGFloat)cornerRadii borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor;


@end
