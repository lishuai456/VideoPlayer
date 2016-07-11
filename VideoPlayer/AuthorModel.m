//
//  AuthorModel.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "AuthorModel.h"

@implementation AuthorModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
         _authorId = value;
    }
}

+ (NSMutableArray *)parseAuthorsWithDic:(NSDictionary *)dic
{
    NSMutableArray *returnAuthors = [NSMutableArray array];
    for (NSDictionary *dict in dic[@"authors"]) {
        AuthorModel *model = [AuthorModel new];
        [model setValuesForKeysWithDictionary:dict];
        [returnAuthors addObject:model];
    }
    return returnAuthors;
}

@end
