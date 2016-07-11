//
//  PlayerView.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerView : UIView
//播放单元
@property (strong, nonatomic)AVPlayerItem *playItem;
//播放视频的Layer (注意类型)
@property (strong, nonatomic)AVPlayerLayer *playerLayer;
//播放器
@property (strong, nonatomic) AVPlayer *player;
//
@property (strong, nonatomic) UIView *interactionView;
//播放进度条
@property (strong, nonatomic)UISlider *progressSlider;

- (instancetype)initWithUrl:(NSString *)url
                      frame:(CGRect)frame;

@end
