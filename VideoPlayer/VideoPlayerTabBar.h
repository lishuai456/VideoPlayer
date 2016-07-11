//
//  DouBanTabBar.h
//  豆瓣项目
//
//  Created by 李帅 on 16/6/28.
//  Copyright © 2016年 linda. All rights reserved.
//
@class VideoPlayerTabBar;
@protocol VideoTabBarDeleage

- (void)VideoItemDidClicked:(VideoPlayerTabBar *)tabBar;

@end

#import <UIKit/UIKit.h>

@interface VideoPlayerTabBar : UITabBar

//当前选中的tabbar的下标
@property (nonatomic,assign)int currenSelected;
//当前选中的item
@property (nonatomic,assign)UIButton *currentSelectedItem;

//tabbar上面所有的item
@property (nonatomic,strong)NSArray *allItens;

@property (nonatomic,weak) id<VideoTabBarDeleage>videoDelegate;

//初始化方法:根据items初始化items
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame;

@end
