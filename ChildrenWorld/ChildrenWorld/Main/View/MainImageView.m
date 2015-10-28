//
//  MainImageView.m
//  ChildrenWorld
//
//  Created by imac on 15/10/14.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "MainImageView.h"

@implementation MainImageView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.image = [UIImage imageNamed:@"儿童首页.jpg"];
        self.userInteractionEnabled = YES;
        
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
