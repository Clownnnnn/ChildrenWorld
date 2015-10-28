//
//  LMKMainViewController.h
//  ChildrenWorld
//
//  Created by imac on 15/10/16.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMKColorPicker.h"
#import "LMKTouchDrawView.h"

@interface LMKMainViewController : UIViewController<LMKColorPickerDelegate>
{
    BOOL isSelectedColor;
}
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet LMKColorPicker *selector1;
@property (weak, nonatomic) IBOutlet LMKColorPicker *selector2;
@property (weak, nonatomic) IBOutlet LMKColorPicker *selector3;
@property (weak, nonatomic) IBOutlet LMKColorPicker *selector4;
@property (weak, nonatomic) IBOutlet LMKColorPicker *selector5;
@property (weak, nonatomic) IBOutlet LMKColorPicker *selector6;
@property (weak, nonatomic) IBOutlet LMKColorPicker *selector7;
@property (weak, nonatomic) IBOutlet LMKTouchDrawView *drawView;
@property (strong, nonatomic) UIButton *callCemera;
@property (nonatomic, strong) UIButton *colorBtn;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end
