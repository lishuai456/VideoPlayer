//
//  AllVideoModel.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//
#import "BaseModel.h"


@interface AllVideoModel : BaseModel

//视频网址
@property (nonatomic, strong) NSString *url;
//视频消息
@property (nonatomic, strong) NSString *message;



@end
