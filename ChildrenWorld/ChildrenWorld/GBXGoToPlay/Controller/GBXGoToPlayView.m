//
//  GBXGoToPlayView.m
//  ChildrenWorld
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "GBXGoToPlayView.h"
#import "GBXGoToPlayItem.h"


#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

const float kMaxAngle = 240.;
const float kMinAngle = 120.;
const float kBeginDuration = 0.25;
const float kTimeDelta = 0.05;

@interface GBXGoToPlayView()
{
    NSMutableArray *arr;
    
    NSMutableArray *hideArr;
    
    CALayer *layer;
}
@end

@implementation GBXGoToPlayView



- (id)initWithTitleArrays:(NSArray *)titleArray
{
    
   
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        arr = [NSMutableArray array];
        
        hideArr = [NSMutableArray array];
        
        for (int i = 0; i < titleArray.count; i++) {
            GBXGoToPlayItem *item = [[GBXGoToPlayItem alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-40, 40) withTitle:titleArray[i] withTag:i];
            
            if (i == 0) {
                UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
                iconImageView.center = CGPointMake(CGRectGetWidth(item.bounds)-30, CGRectGetHeight(item.bounds)/2);
                iconImageView.image = [UIImage imageNamed:@"cancel"];
                [item addSubview:iconImageView];
            }
            item.layer.position = CGPointMake(30, CGRectGetHeight(self.bounds)/2);
            item.userInteractionEnabled = NO;
            [self addSubview:item];
            [arr addObject:item];
            
        }
        
        
        for (int i = (int)(titleArray.count-1); i>=0; i--) {
            GBXGoToPlayItem *item = arr[i];
            
            [self bringSubviewToFront:item];
        }
        
        CGFloat delta = (kMaxAngle-kMinAngle)/(arr.count-1);
        for (int i =0 ; i< titleArray.count; i++) {
            UIView *item = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-40, 40)];
            item.layer.anchorPoint = CGPointMake(0.95, 0.5);
            item.layer.position = CGPointMake(30, CGRectGetHeight(self.bounds)/2);
            item.tag = i;

            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleItemTapAction:)];
            [item addGestureRecognizer:tap];
            
            CGFloat degrees = -(kMaxAngle-delta*i);
            item.layer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(degrees), 0, 0, 1);
            
            item.backgroundColor = [UIColor clearColor];
      //      item.userInteractionEnabled = NO;
            item.userInteractionEnabled = YES;
            [self addSubview:item];
            [hideArr addObject:item];

            
            
        }
        
    }
    
    return self;
}

- (void)showMenu
{
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.75];
    } completion:^(BOOL finished) {
        for (UIView *item in hideArr) {
            item.userInteractionEnabled = YES;
        }
        
        CGFloat delta = (kMaxAngle-kMinAngle)/(arr.count-1);
        for (int i =0; i<arr.count; i++) {
            
            CGFloat degrees = -(kMaxAngle-delta*i);
            CGFloat duration = kBeginDuration+kTimeDelta*i;
            GBXGoToPlayItem *item = arr[i];
            
            [item.layer addAnimation:[self rotateArrowViewByAngle:degrees withDuration:duration] forKey:@"rotate"];
            
            
        }
        
    }];
    
}

- (void)hideMenu
{
    for (UIView *item in hideArr) {
        item.userInteractionEnabled = NO;
    }
    
    CGFloat delta = (kMaxAngle-kMinAngle)/(arr.count-1);
    for (int i =0; i<arr.count; i++) {
        
        CGFloat radians = -(kMaxAngle-delta*i);
        CGFloat duration = kBeginDuration+kTimeDelta*(arr.count - i -1);
        GBXGoToPlayItem *item = arr[i];
        item.layer.transform = CATransform3DIdentity;
        [item.layer removeAllAnimations];
        [item.layer addAnimation:[self rotateBackArrowViewByAngle:radians withDuration:duration] forKey:@"rotateBack"];
        
    }
    
    [self performSelector:@selector(removeFromSuperview) withObject:self afterDelay:(kBeginDuration+kTimeDelta*(arr.count-1))];
    
    
}

- (void)beginingAnimation
{
    CGFloat delta = (kMaxAngle-kMinAngle)/(arr.count-1);
    for (int i =0; i<arr.count; i++) {
        
        CGFloat radians = -(kMaxAngle-delta*i);
        CGFloat duration = kBeginDuration+kTimeDelta*(arr.count - i -1);
        GBXGoToPlayItem *item = arr[i];
        item.layer.transform = CATransform3DIdentity;
        [item.layer removeAllAnimations];
        [item.layer addAnimation:[self rotateBackArrowViewByAngle:radians withDuration:duration] forKey:@"rotateBack"];
        
    }
}

- (CABasicAnimation *)rotateArrowViewByAngle:(CGFloat)degrees
   withDuration:(NSTimeInterval)duration
{
    
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    spinAnimation.fromValue = [NSNumber numberWithFloat:0];
    spinAnimation.toValue = [NSNumber numberWithFloat:degrees / 180.0 * M_PI];
    spinAnimation.duration = duration;
    spinAnimation.cumulative = YES;
    spinAnimation.additive = YES;
    spinAnimation.delegate = self;
    spinAnimation.removedOnCompletion = NO;
    
    spinAnimation.fillMode = kCAFillModeForwards;
    
    return spinAnimation;
}



- (CABasicAnimation *)rotateBackArrowViewByAngle:(CGFloat)degrees
   withDuration:(NSTimeInterval)duration
{
    
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    spinAnimation.fromValue = [NSNumber numberWithFloat:degrees / 180.0 * M_PI];
    spinAnimation.toValue = [NSNumber numberWithFloat:0];
    spinAnimation.duration = duration;
    spinAnimation.cumulative = YES;
    spinAnimation.additive = YES;
    spinAnimation.removedOnCompletion = NO;
    spinAnimation.delegate = self;
    spinAnimation.fillMode = kCAFillModeForwards;
    
    return spinAnimation;
}

- (void)handleItemTapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"tap tag is %ld",(long)tap.view.tag);
    if ([self.delega respondsToSelector:@selector(GBXGoToPlayView:DidChoose:)]) {
        [self.delega GBXGoToPlayView:self DidChoose:tap.view.tag];
        
    }
    [self hideMenu];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
