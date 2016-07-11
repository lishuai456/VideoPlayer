//
//  AuthorTableViewCell.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorModel.h"
#define AuthorTableViewCell_Identify @"AuthorTableViewCell_Identify"
@interface AuthorTableViewCell : UITableViewCell
//头像
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
//名字
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//时间
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
//排名
@property (weak, nonatomic) IBOutlet UILabel *rangeLabel;

@property (nonatomic, strong) AuthorModel *model;

@end
