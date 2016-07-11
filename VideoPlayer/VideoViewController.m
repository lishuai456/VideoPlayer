//
//  VideoViewController.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "VideoViewController.h"
#import "AuthorDateilCollectionViewCell.h"
#import "VideoRequest.h"
#import "VideoModel.h"
#import "VideoDetailRequest.h"
#import "AllVideoModel.h"
#import "PlayerView.h"
@interface VideoViewController ()
<
   UICollectionViewDataSource,
   UICollectionViewDelegate,
   UICollectionViewDelegateFlowLayout,
   AuthorDateilCollectionViewCellDelegate

>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

//显示布局的形式
@property (assign, nonatomic) NSInteger layoutType;


@property (strong, nonatomic)NSMutableArray *videoArr;
//播放视频所需要的view
@property (strong, nonatomic)PlayerView *playerView;
//获得当前视频的cell
@property (strong, nonatomic) AuthorDateilCollectionViewCell *currentCell;

@property (assign,nonatomic)BOOL isPlayer;
//当前每行的path
@property (strong,nonatomic)NSIndexPath *curentPath;

@property (strong, nonatomic)NSArray *visibleIndexpaths;

@property (assign, nonatomic)BOOL isOnCell;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //0是一行显示两个item
    self.tabBarController.tabBar.hidden = YES;
    self.videoArr = [NSMutableArray array];
    self.layoutType = 0;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    self.collectionView.collectionViewLayout = layout;
    layout.itemSize = CGSizeMake(WindowWidth/2, 228);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"AuthorDateilCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:AuthorDateilCollectionViewCell_Identify];
    [self addRightItem];
    if (self.sourceFrom == 0) {
        [self requestDotaVideos];
    }else {
    [self requestLOLVideos];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.layoutType == 0) {
        return CGSizeMake(WindowWidth /2.0, 228);
    }
    else if (self.layoutType == 1)
    {
        return CGSizeMake(WindowWidth, 228);
    }
    return CGSizeMake(WindowWidth/2.0, 228);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addRightItem
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(changeLayoutType:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)requestDotaVideos
{
    __weak typeof(self) weakSelf = self;
    [[VideoRequest shareVideoRequest]requestDotaSingleAuthorAllVideoWithAuThorID:self.authorID Success:^(NSDictionary *dic) {
     //   NSLog(@"DotaAuThorVideo = %@",dic);
        weakSelf.videoArr = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.collectionView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (void)requestLOLVideos
{
    __weak typeof(self) weakSelf = self;
    [[VideoRequest shareVideoRequest]requestLOLSingleAuthorAllVideoWithAuthorID:self.authorID success:^(NSDictionary *dic) {
        NSLog(@"LOLAuThorVideo = %@",dic);
        weakSelf.videoArr = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.collectionView reloadData];
        });

    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (void)changeLayoutType:(UIBarButtonItem *)item
{
    if (self.layoutType == 0) {
        self.layoutType = 1;
    }
    else if (self.layoutType == 1)
    {
        self.layoutType = 0;
    }
    else
    {
    
    }
    [self.collectionView reloadData];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.videoArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AuthorDateilCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AuthorDateilCollectionViewCell_Identify forIndexPath:indexPath];
    cell.type = (int)self.layoutType;
    cell.delegate = self;
    VideoModel *model = self.videoArr[indexPath.row];
    cell.model = model;
    self.visibleIndexpaths = [self.collectionView indexPathsForVisibleItems];
    NSLog(@"%--------@",self.visibleIndexpaths);
    return cell;

}
//点击cell上的播放按钮,播放cell上的视频
- (void)AuthorDateilCollectionViewPlayBtnClicked:(AuthorDateilCollectionViewCell *)cell
{
    //获得cell的所在行
    self.curentPath = [self.collectionView indexPathForCell:cell];
    self.currentCell = cell;
    if (self.playerView && self.isPlayer) {
        [self.playerView.player pause];
        [self.playerView removeFromSuperview];
        self.isPlayer = NO;
    }
    //视频播放
    VideoModel *model = cell.model;
    //根据model的id去请求视频的url
   [[VideoDetailRequest shareVideoDetailRequest]requestDotaVieoWithVieoID:model.videoId success:^(NSDictionary *dic) {
       NSLog(@"-----------%@------------",dic);
       AllVideoModel *model = [AllVideoModel new];
       [model setValuesForKeysWithDictionary:dic];
       self.playerView = [[PlayerView alloc]initWithUrl:model.url frame:cell.bounds];
       [cell.contentView addSubview:self.playerView];
   } failure:^(NSError *error) {
       NSLog(@"%@",error);
   }];
    
    [[VideoDetailRequest shareVideoDetailRequest]requestLoLVieoWithVieoID:model.videoId success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        AllVideoModel *model = [AllVideoModel new];
        [model setValuesForKeysWithDictionary:dic];
        self.playerView = [[PlayerView alloc]initWithUrl:model.url frame:cell.bounds];
        [cell.contentView addSubview:self.playerView];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
   
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //先把cell的坐标转化成屏幕坐标
   CGRect changedFrame = [self.currentCell convertRect:self.currentCell.frame toView:self.view];
    if (changedFrame.origin.y <= changedFrame.size.height ||  changedFrame.origin.y >=WindowHeight) {
        [self putToRightCorner];
    }
    else{
        [self backToCell];
    }
}

//当cell花出去的时候,放到右下角播放
- (void)putToRightCorner
{
    if (self.isPlayer && self.isOnCell) {
        [self.playerView removeFromSuperview];
        [UIView animateWithDuration:0.5 animations:^{
            
            CGRect rightFrame = CGRectMake(WindowWidth / 2.0, WindowHeight * 3.0 /4.0, WindowWidth / 2.0, WindowHeight / 4.0);
            
            self.playerView.frame = rightFrame;
            //把这个layer的frame也改变
            self.playerView.playerLayer.frame =  self.playerView.bounds;
            //            [[UIApplication sharedApplication].keyWindow addSubview:self.playerView];
            self.isOnCell = NO;
            [self.view addSubview:self.playerView];
            [self.view bringSubviewToFront:self.playerView];
            
        }];
    }
}

//回到cell上

- (void)backToCell
{
    //    if (self.isPlaying && !self.isOnCell) {
    
    //先获取屏幕上的所有cell
    //先找到属于哪个cell
    NSLog(@"indexpath aaaaaaa = %@", self.visibleIndexpaths);
    NSLog(@"self.currentPath = %@", self.curentPath);
    if ([self.visibleIndexpaths containsObject:self.curentPath]) {
        if (self.isPlayer) {
            [self.playerView removeFromSuperview];
            //然后把PlayerView增加到这个cell上
            
            [UIView animateWithDuration:0.5 animations:^{
                self.playerView.frame = self.currentCell.bounds;
                self.playerView.playerLayer.frame =  self.playerView.bounds;
                [self.currentCell.contentView addSubview:self.playerView];
                [self.currentCell.contentView bringSubviewToFront:self.playerView];
                self.isOnCell = YES;
            }];
            
        }
    }
    //    }
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
