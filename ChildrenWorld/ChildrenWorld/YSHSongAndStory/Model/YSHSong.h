//
//  YSHSong.h
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSHSong : NSObject
{
    NSString *name;
    NSString *type;
}
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *type;

- (id)initWithName:(NSString *)_name andType:(NSString *)_type;

@end
