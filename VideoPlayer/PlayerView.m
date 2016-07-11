//
//  PlayerView.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "PlayerView.h"

@interface PlayerView ()

@property (nonatomic, assign) BOOL isShowInterview;

@end

@implementation PlayerView


- (instancetype)initWithUrl:(NSString *)url
                      frame:(CGRect)frame
{
    if (self = [super init]) {
        self.frame = frame;
        self.backgroundColor = [UIColor blackColor];
        _playItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:url]];
        _player = [[AVPlayer alloc]initWithPlayerItem:_playItem];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        [self.layer addSublayer:_playerLayer];
        _playerLayer.frame = self.bounds;
        [_player addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        
//        [_player addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        //当状态变为readytoPlay的时候,播放视频
        NSLog(@"change == %@",change);
        if (_player.status == AVPlayerStatusReadyToPlay) {
            [_player play];
            self.progressSlider.maximumValue = CMTimeGetSeconds(self.player.currentItem.duration);
        }else if (_player.status == AVPlayerStatusFailed)
        {
            NSLog(@"播放失败");
        }else
        {
            NSLog(@"other");
        }
    }
}

- (void)addSlider
{
    self.progressSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, self.bounds.size.height - 20, self.bounds.size.width - 40, 20)];
    self.progressSlider.maximumTrackTintColor = [UIColor grayColor];
    self.progressSlider.thumbTintColor = [UIColor greenColor];
    self.progressSlider.minimumTrackTintColor = [UIColor whiteColor];
    [self.progressSlider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    [self.interactionView addSubview:self.progressSlider];
}

- (void)changeProgress:(UISlider *)slider
{
    CMTime current = self.player.currentTime;
    current.value = slider.value;
}

- (void)addMyInteractionView
{
    self.interactionView = [[UIView alloc]initWithFrame:self.bounds];
    self.interactionView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.interactionView];
    self.interactionView.hidden = !self.isShowInterview;
    [self addSlider];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(controlInteractionView)];
    [self.interactionView addGestureRecognizer:tap];
}
- (void)controlInteractionView
{
    self.interactionView.hidden = !self.isShowInterview;
    self.isShowInterview = !self.isShowInterview;
}

- (void)dealloc
{
    [_player removeObserver:self forKeyPath:@"status" context:nil];
    //[_player removeObserver:self forKeyPath:@"loadedTimeRanges"];
}

@end
