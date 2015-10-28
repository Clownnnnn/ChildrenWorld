//
//  GBXGoToPlayItem.m
//  ChildrenWorld
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "GBXGoToPlayItem.h"

@interface GBXGoToPlayItem ()
{
    UIView *controlButton;
    UILabel *titleLabel;
    
    
}

@end

@implementation GBXGoToPlayItem

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title withTag:(NSInteger)tag
{
    if (self = [super initWithFrame:frame]) {
        
        
        
        
        controlButton = [[UIView alloc] init];
        controlButton.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        controlButton.backgroundColor = [UIColor whiteColor];
        controlButton.layer.cornerRadius = 3;
        controlButton.layer.masksToBounds = YES;
        [self addSubview:controlButton];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(-50, 5, 200, 30)];
        titleLabel.text = title;
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        titleLabel.layer.transform = CATransform3DRotate(titleLabel.layer.transform, M_PI, 1, 0, 0);
        [titleLabel sizeToFit];
        [self addSubview:titleLabel];
        
        self.layer.shouldRasterize = YES;
        //条形边框色
        self.layer.shadowColor=[UIColor redColor].CGColor;
        self.layer.shadowOffset=CGSizeMake(-2, -2);
        self.layer.shadowOpacity=.9;
        CGPoint anchorPoint = CGPointMake(0.95, 0.5);
        self.layer.anchorPoint = anchorPoint;
        
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
