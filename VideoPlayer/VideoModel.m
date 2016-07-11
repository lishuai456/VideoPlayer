//
//  VideoModel.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _videoId = value;
    }
}

+ (NSMutableArray *)parseVideoWithDic:(NSDictionary *)dic
{
    NSMutableArray *returnVideos = [NSMutableArray array];
    NSArray *videos = [dic objectForKey:@"videos"];
    for (NSMutableDictionary *tmpDic in videos) {
        VideoModel *model = [[VideoModel alloc]init];
        [model setValuesForKeysWithDictionary:tmpDic];
        [returnVideos addObject:model];
    }
    return returnVideos;
}
@end
