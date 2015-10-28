//
//  YSHMainView.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Souls. All rights reserved.
//

#import "YSHMainView.h"
#import "YSHSingSongViewController.h"
#import "YSHTellStoryViewController.h"
@implementation YSHMainView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.mainImageView];
        [self.mainImageView addSubview:self.singSongBtn];
        [self.mainImageView addSubview:self.tellStoryBtn];

    }
    return self;
}

-(UIImageView *)mainImageView
{
    if (!_mainImageView) {
        UIImage *image = [UIImage imageNamed:@"sleep.jpg"];
        _mainImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
        self.mainImageView.userInteractionEnabled = YES;
        self.mainImageView.image = image;
    }
    return _mainImageView;

}
-(UIButton *)singSongBtn
{
    if (!_singSongBtn) {
        _singSongBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        _singSongBtn.backgroundColor = [UIColor orangeColor];
        _singSongBtn.layer.cornerRadius = 50;
        [_singSongBtn setTitle:@"听儿歌" forState:UIControlStateNormal];
    }
    return _singSongBtn;
}
-(UIButton *)tellStoryBtn
{
    if (!_tellStoryBtn) {
        _tellStoryBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 100, 100)];
        _tellStoryBtn.backgroundColor = [UIColor orangeColor];
        _tellStoryBtn.layer.cornerRadius = 50;
        [_tellStoryBtn setTitle:@"讲故事" forState:UIControlStateNormal];
    }
    return _tellStoryBtn;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
