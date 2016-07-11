//
//  AuthorModel.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "BaseModel.h"

@interface AuthorModel : BaseModel

@property (assign, nonatomic)BOOL watchable;

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *url;

@property (copy, nonatomic) NSString *detail;

@property (assign, nonatomic) NSInteger pop;

@property (copy, nonatomic) NSString *youku_id;

@property (copy, nonatomic) NSString *authorId;

@property (copy, nonatomic) NSString *icon;

+ (NSMutableArray *)parseAuthorsWithDic:(NSDictionary *)dic;
@end
