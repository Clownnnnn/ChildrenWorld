//
//  LMKColorPicker.h
//  ChildrenWorld
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LMKColorPickerDelegate <NSObject>

@optional
- (void)aColorPickerIsSelected:(UIColor *)color;

@end
@interface LMKColorPicker : UIView
@property (nonatomic, weak)id<LMKColorPickerDelegate>delegate;
@end
