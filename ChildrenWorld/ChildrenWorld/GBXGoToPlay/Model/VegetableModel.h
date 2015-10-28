//
//  VegetableModel.h
//  ChildrenWorld
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VegetableModel : NSObject

@property (nonatomic, copy) NSString *answerStr;
@property (nonatomic, copy) NSString *iconStr;
@property (nonatomic, copy) NSArray *optionsArr;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)dataWithDictionary:(NSDictionary *)dict;

@end
