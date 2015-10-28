//
//  LMKTouchDrawView.h
//  ChildrenWorld
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMKLine.h"

@interface LMKTouchDrawView : UIView
@property (nonatomic, strong)LMKLine *currentLine;
@property (nonatomic, strong)NSMutableArray *linesCompleted;
@property (nonatomic, strong)NSMutableArray *allLines;
@property (nonatomic, strong)UIColor *drawColor;
@end
