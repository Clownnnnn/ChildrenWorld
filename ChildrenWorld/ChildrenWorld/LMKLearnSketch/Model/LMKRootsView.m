//
//  LMKRootsView.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "LMKRootsView.h"

@implementation LMKRootsView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-30)];
        self.imageView.backgroundColor = [UIColor whiteColor];
        self.imageView.userInteractionEnabled = YES;
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 30)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor blackColor];
        [self.label adjustsFontSizeToFitWidth];
        
        self.button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-30)];
        self.button.backgroundColor = [UIColor colorWithWhite:1 alpha:0.02];
        
        [self addSubview:self.imageView];
        [self addSubview:self.label];
        [self addSubview:self.button];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
