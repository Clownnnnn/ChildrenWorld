//
//  FlowerModel.h
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlowerModel : NSObject

@property (nonatomic, copy) NSString *answerStr;
@property (nonatomic, copy) NSString *iconStr;
@property (nonatomic, copy) NSArray *optionsArr;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)dataWithDictionary:(NSDictionary *)dict;


@end
