//
//  LMKLeadButton.m
//  ChildrenWorld
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "LMKLeadButton.h"

@implementation LMKLeadButton

-(instancetype)initWithFrame:(CGRect)frame WithImageName:(NSString *)name
{
    if (self = [super initWithFrame:frame])
    {
        self.layer.cornerRadius = 50;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:name]];
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
