//
//  GBXGoToPlayView.h
//  ChildrenWorld
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GBXGoToPlayViewDelegate <NSObject>

- (void)GBXGoToPlayView:(UIView *)view DidChoose:(NSInteger)tag;

@end

@interface GBXGoToPlayView : UIView
//lmk
//@property (nonatomic, strong)UIButton *chooseButton;

@property (nonatomic, weak) id<GBXGoToPlayViewDelegate> delega;

- (id)initWithTitleArrays:(NSArray *)titleArray;

- (void)showMenu;

- (void)hideMenu;
@end
