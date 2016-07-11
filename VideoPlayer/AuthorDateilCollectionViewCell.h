//
//  AuthorDateilCollectionViewCell.h
//  
//
//  Created by 李帅 on 16/7/8.
//
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
#define AuthorDateilCollectionViewCell_Identify @"AuthorDateilCollectionViewCell_Identify"

@class AuthorDateilCollectionViewCell;

@protocol AuthorDateilCollectionViewCellDelegate<NSObject>

- (void)AuthorDateilCollectionViewPlayBtnClicked:(AuthorDateilCollectionViewCell *)cell;

@end


@interface AuthorDateilCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dataView;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@property (assign, nonatomic)id<AuthorDateilCollectionViewCellDelegate>delegate;

@property (assign, nonatomic)int type;

@property (strong, nonatomic) VideoModel *model;


@end
