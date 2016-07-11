//
//  VideoViewController.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "BaseViewController.h"

@interface VideoViewController : BaseViewController

@property (copy, nonatomic)NSString *authorID;
//判断是从dota主播界面进来 还是lol主播解码进来
@property (assign, nonatomic)NSInteger sourceFrom;
@end
