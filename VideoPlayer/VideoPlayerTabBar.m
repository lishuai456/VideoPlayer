//
//  DouBanTabBar.m
//  豆瓣项目
//
//  Created by 李帅 on 16/6/28.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "VideoPlayerTabBar.h"

@implementation VideoPlayerTabBar

//初始化方法:根据items初始化items
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame
{
    if (self = [super init]) {
        self.frame = frame;
        for (int i = 0; i < items.count; i++) {
            UIButton *btn = (UIButton *)items[i];
            CGFloat width = self.bounds.size.width / items.count;
            CGFloat height = self.bounds.size.height;
            btn.frame = CGRectMake(i*width, 0, width, height);
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
        }
        self.currenSelected = 0;
        self.currentSelectedItem = items[0];
        self.allItens = items;
    }
    return self;
}

- (void)btnClicked:(UIButton *)btn
{
    self.currentSelectedItem = btn;
    for (int i = 0; i < self.allItens.count; i++) {
        UIButton *tempBtn = (UIButton *)self.allItens[i];
        if (btn == tempBtn) {
            self.currenSelected = i;
            tempBtn.selected = YES;
        }
        else
        {
            tempBtn.selected = NO;
        }
    }
    
    if (_videoDelegate) {
        [_videoDelegate VideoItemDidClicked:self];
    }
}


@end
