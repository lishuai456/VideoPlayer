//
//  RootViewController.m
//  豆瓣项目
//
//  Created by 李帅 on 16/6/28.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "RootViewController.h"
#import "VideoPlayerTabBar.h"
@interface RootViewController ()<VideoTabBarDeleage>



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.tabBar.hidden = YES;
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"2image"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"2imageH"] forState:(UIControlStateSelected)];
    /**
     *   Button 自带 Image 属性的偏移量
     *
     *  @param top   距离上边缘的尺寸
     *  @param left   距离左边缘的尺寸
     *  @param bottom  距离下边缘的尺寸
     *  @param right 距离右边缘的尺寸
     *
     *  @return 图片的偏移距离
     */
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setImage:[UIImage imageNamed:@"first_normal"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"first_selected"] forState:(UIControlStateSelected)];
    [btn3 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, -35))];
    [btn3 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -35, -30, 0))];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setTitle:@"活动" forState:UIControlStateNormal];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setImage:[UIImage imageNamed:@"second_normal"] forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"second_selected"] forState:(UIControlStateSelected)];
    [btn4 setTitle:@"我的" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, -35))];
    [btn4 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -35, -30, 0))];
    
    self.dbTabBar = [[VideoPlayerTabBar alloc] initWithItems:@[ btn3,btn4] frame:CGRectMake(0, self.view.bounds.size.height -49, self.view.bounds.size.width, 49)];
    //NSLog(@"frame = %@", NSStringFromCGRect(self.dbTabBar.frame));
    [self.view addSubview:self.dbTabBar];
    self.dbTabBar.videoDelegate = self;
    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:255.0/255 green:20/255 blue:25/255 alpha:1]];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:255.0/255 green:20/255 blue:25/255 alpha:1]];
}



- (void)VideoItemDidClicked:(VideoPlayerTabBar *)tabBar
{
    self.selectedIndex = tabBar.currenSelected;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
