//
//  YSHSong.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "YSHSong.h"

@implementation YSHSong
@synthesize name,type;
- (id)initWithName:(NSString *)_name andType:(NSString *)_type {
    if (self = [super init]) {
        self.name = _name;
        self.type = _type;
    }
    return self;
}

@end
