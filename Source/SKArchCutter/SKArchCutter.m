//
//  SKArchCutter.m
//  SKArchCutter
//
//  Created by shevchenko on 17/3/28.
//  Copyright © 2017年 shevchenko. All rights reserved.
//

#import "SKArchCutter.h"


@implementation SKArchCutter

#pragma mark - 切割UIView、UIButton和UILabel
+ (void)cuttingView:(UIView *)view cuttingDirection:(UIRectCorner)direction cornerRadii:(CGFloat)cornerRadii borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor
{
    if (view.bounds.size.height != 0 && view.bounds.size.width != 0) {// 使用Masonry布局后，view的bounds是异步返回的，这里需要做初步的判断
        CGFloat width = view.bounds.size.width, height = view.bounds.size.height;
        
        UIImage * image = nil;
        // 先利用CoreGraphics绘制一个圆角矩形
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
        CGContextRef currnetContext = UIGraphicsGetCurrentContext();
        if (currnetContext) {
            if (backgroundColor == nil) {
                backgroundColor = [UIColor clearColor];
            }
            CGContextSetFillColorWithColor(currnetContext, backgroundColor.CGColor);// 设置填充颜色
            CGContextSetStrokeColorWithColor(currnetContext, borderColor.CGColor);// 设置画笔颜色
            
            if (cornerRadii == 0) {
                cornerRadii = view.bounds.size.height / 2;
            }
            // 单切全角
            if (direction == UIRectCornerAllCorners) {
                CGContextMoveToPoint(currnetContext, width - borderWidth, cornerRadii + borderWidth);// 从右下开始
                CGContextAddArcToPoint(currnetContext, width - borderWidth, height - borderWidth, width - cornerRadii - borderWidth, height - borderWidth, cornerRadii);// 右下角角度
                CGContextAddArcToPoint(currnetContext, borderWidth, height - borderWidth, borderWidth, height - cornerRadii - borderWidth, cornerRadii);// 左下角角度
                CGContextAddArcToPoint(currnetContext, borderWidth, borderWidth, width - borderWidth, borderWidth, cornerRadii);// 左上角
                CGContextAddArcToPoint(currnetContext, width - borderWidth, borderWidth, width - borderWidth, cornerRadii + borderWidth, cornerRadii);// 右上角
                
            } else {
                // 单切左上角
                CGContextMoveToPoint(currnetContext, cornerRadii + borderWidth, borderWidth);// 从左上开始
                if (direction & UIRectCornerTopLeft) {
                    CGContextAddArcToPoint(currnetContext, borderWidth, borderWidth, borderWidth, cornerRadii + borderWidth, cornerRadii);// 左上角
                } else {
                    CGContextAddLineToPoint(currnetContext, borderWidth, borderWidth);
                }
                if (direction & UIRectCornerBottomLeft) {
                    CGContextAddArcToPoint(currnetContext, borderWidth, height - borderWidth, borderWidth + cornerRadii, height - borderWidth, cornerRadii);
                } else {
                    CGContextAddLineToPoint(currnetContext, borderWidth, height - borderWidth);// 左侧线
                }
                if (direction & UIRectCornerBottomRight) {
                    CGContextAddArcToPoint(currnetContext, width - borderWidth, height - borderWidth, width - borderWidth, height - borderWidth - cornerRadii, cornerRadii);
                } else {
                    CGContextAddLineToPoint(currnetContext, width - borderWidth, height - borderWidth);// 底部线
                }
                if (direction & UIRectCornerTopRight) {
                    CGContextAddArcToPoint(currnetContext, width - borderWidth, borderWidth, width - borderWidth - cornerRadii, borderWidth, cornerRadii);
                    
                } else {
                    CGContextAddLineToPoint(currnetContext, width - borderWidth, borderWidth);// 右侧线
                }
                CGContextAddLineToPoint(currnetContext, borderWidth + cornerRadii, borderWidth);
                
            }
            
            CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
            image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        // 绘制完成后，将UIImageView插入到view视图层级的底部
        if ([image isKindOfClass:[UIImage class]]) {
            UIImageView * baseImageView = [[UIImageView alloc] initWithImage:image];
            [view insertSubview:baseImageView atIndex:0];
        }
    } else { // 如果没有获取到view的bounds时
        dispatch_async(dispatch_get_main_queue(), ^{
            [self cuttingView:view cuttingDirection:direction cornerRadii:cornerRadii borderWidth:borderWidth borderColor:borderColor backgroundColor:backgroundColor];
        });
    }
}

#pragma mark - 切割UIImageView
+ (void)cuttingImageView:(UIImageView *)imageView cuttingDirection:(UIRectCorner)direction cornerRadii:(CGFloat)cornerRadii borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor
{
    if (imageView.bounds.size.height != 0 && imageView.bounds.size.width != 0) {
        // 先截取UIImageView视图Layer生成的Image，然后再做渲染
        UIImage * image = nil;
        if (imageView.image) {
            image = imageView.image;
        }
        if (cornerRadii == 0) {
            cornerRadii = imageView.bounds.size.height / 2;
        }
        CGRect rect = CGRectMake(0, 0, imageView.bounds.size.width, imageView.bounds.size.height);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
        CGContextRef currnetContext = UIGraphicsGetCurrentContext();
        if (currnetContext) {
            
            UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:direction cornerRadii:CGSizeMake(cornerRadii - borderWidth, cornerRadii - borderWidth)];
            CGContextAddPath(currnetContext,path.CGPath);
            CGContextClip(currnetContext);
            
            [image drawInRect:rect];
            [borderColor setStroke];// 画笔颜色
            [backgroundColor setFill];// 填充颜色
            [path stroke];
            [path fill];
//            CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
            image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        if ([image isKindOfClass:[UIImage class]]) {
            imageView.image = image;
        } else { // UITableViewCell的UIImageView，第一次创建赋图时，可能无法获取UIImageView视图layer的图片
            dispatch_async(dispatch_get_main_queue(), ^{
                [self cuttingImageView:(UIImageView *)imageView cuttingDirection:(UIRectCorner)direction cornerRadii:(CGFloat)cornerRadii borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor];
            });
        }
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self cuttingImageView:(UIImageView *)imageView cuttingDirection:(UIRectCorner)direction cornerRadii:(CGFloat)cornerRadii borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor];
        });
    }
}

@end
