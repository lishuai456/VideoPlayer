//
//  AuthorTableViewCell.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "AuthorTableViewCell.h"

@implementation AuthorTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.headerView.layer.masksToBounds = YES;
    self.headerView.layer.cornerRadius = self.headerView.bounds.size.width/2.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(AuthorModel *)model
{
    _model = model;
    [self.headerView setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"3"]];
    ;
    self.nameLabel.text = model.name;
    self.dataLabel.text = model.detail;
    self.rangeLabel.text = [NSString stringWithFormat:@"%ld",model.pop];
    
}

@end
