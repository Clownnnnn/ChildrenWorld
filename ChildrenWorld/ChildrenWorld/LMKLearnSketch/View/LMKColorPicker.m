//
//  LMKColorPicker.m
//  ChildrenWorld
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "LMKColorPicker.h"

@implementation LMKColorPicker

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(aColorPickerIsSelected:)])
    {
        [_delegate aColorPickerIsSelected:[self backgroundColor]];
    }
    self.layer.borderWidth = 2;
    self.layer.borderColor = [[UIColor magentaColor]CGColor];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.layer.borderWidth = 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
