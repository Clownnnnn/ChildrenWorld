//
//  YSHTellStoryView.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "YSHTellStoryView.h"

@implementation YSHTellStoryView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView];
    }
    return self;
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
        UIImage *image = [UIImage imageNamed:@"讲故事_meitu_3.jpg"];
        _imageView.image = image;
        for (int i = 1; i<7;i++ ) {
            _button = [[UIButton alloc]initWithFrame:CGRectMake(i*78, 235, 70, 90)];
            if (i > 3) {
                _button = [[UIButton alloc]initWithFrame:CGRectMake((i-3)*78, 375, 70, 90)];
            }
            _button.backgroundColor = [UIColor clearColor];
            _button.tag = i;
            [_imageView addSubview:_button];
        }

    }
    return _imageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
