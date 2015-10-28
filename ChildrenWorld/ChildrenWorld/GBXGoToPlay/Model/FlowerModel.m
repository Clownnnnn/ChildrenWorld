//
//  FlowerModel.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "FlowerModel.h"

@implementation FlowerModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _answerStr = dict[@"answer"];
        _iconStr = dict[@"icon"];
        _optionsArr = dict[@"options"];
    }
    return self;
}

+ (instancetype)dataWithDictionary:(NSDictionary *)dict
{
    return [[FlowerModel alloc] initWithDictionary:dict];
}


@end
