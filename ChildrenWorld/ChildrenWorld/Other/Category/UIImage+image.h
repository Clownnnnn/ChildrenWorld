//
//  UIImage+image.h
//  01新浪微博-Demo
//
//  Created by nanding on 15/10/8.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

// instancetype默认会识别当前是哪个类或者对象调用，就会转换成对应的类的对象
// UIImage *

// 加载最原始的图片，没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

+ (instancetype)imageWithStretchableName:(NSString *)imageName;

@end
