//
//  UIImage+image.m
//  01新浪微博-Demo
//
//  Created by nanding on 15/10/8.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (instancetype)imageWithOriginalName:(NSString *)imageName
{

    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *originImg = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return originImg;
    
}

+ (instancetype)imageWithStretchableName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}



@end
