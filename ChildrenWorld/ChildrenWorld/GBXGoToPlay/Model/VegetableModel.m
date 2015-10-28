//
//  VegetableModel.m
//  ChildrenWorld
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "VegetableModel.h"

@implementation VegetableModel

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
    return [[VegetableModel alloc] initWithDictionary:dict];
}



@end
