//
//  AuthorDateilCollectionViewCell.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "AuthorDateilCollectionViewCell.h"

@implementation AuthorDateilCollectionViewCell


- (void)awakeFromNib{

}
- (void)setType:(int)type
{
    _type = type;
    if (_type == 1) {
        _playBtn.hidden = NO;
    }else{
        _playBtn.hidden = YES;
    }

}
- (IBAction)palyBtnClicked:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(AuthorDateilCollectionViewPlayBtnClicked:)]) {
        [_delegate AuthorDateilCollectionViewPlayBtnClicked:self];
    }
}


- (void)setModel:(VideoModel *)model
{
    _model = model;
    [_dataView setImageWithURL:[NSURL URLWithString:model.thumb]];
    _timeLabel.text = [NSString stringWithFormat:@"%@",model.time];
    _dataLabel.text = model.date;
    _titleLabel.text = model.title;
}

@end
