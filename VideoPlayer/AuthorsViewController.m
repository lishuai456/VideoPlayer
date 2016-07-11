//
//  AuthorsViewController.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "AuthorsViewController.h"
#import "AuthorTableViewCell.h"
#import "AuthorRequest.h"
#import "AuthorModel.h"
#import "VideoViewController.h"
@interface AuthorsViewController ()
<
   UITableViewDataSource,
   UITableViewDelegate,
   UIScrollViewDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *dotaTableView;
@property (weak, nonatomic) IBOutlet UITableView *lolTableView;
@property (nonatomic, strong)NSMutableArray *dotaArray;
@property (strong ,nonatomic)NSMutableArray *lolArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmet;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollVIew;
@end

@implementation AuthorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //两个tableView的注册
    self.dotaArray = [NSMutableArray array];
    self.lolArray = [NSMutableArray array];
    [self.dotaTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AuthorTableViewCell_Identify];
    
    [self.lolTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AuthorTableViewCell_Identify];
    [self requestDotaAuthors];
    [self requestLOLAuthors];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.rootVC.dbTabBar.hidden = NO;
}
- (IBAction)segmentAction:(UISegmentedControl *)sender {
    [self.scrollVIew setContentOffset:CGPointMake(sender.selectedSegmentIndex *WindowWidth, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.segmet.selectedSegmentIndex = self.scrollVIew.contentOffset.x/WindowWidth;
}

- (void)requestDotaAuthors
{
    __weak typeof(self)weakSelf = self;
    [[AuthorRequest shareAutorRequest]requestDotaAllAuthorsSuccess:^(NSDictionary *dic) {
  //  NSLog(@" dota dic = %@",dic);
        weakSelf.dotaArray = [AuthorModel parseAuthorsWithDic:dic];
             dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.dotaTableView reloadData];
        });
       } failure:^(NSError *error) {
    NSLog(@"error = %@",error);
       }];
}
- (void)requestLOLAuthors
{
    __weak typeof(self)weakSelf = self;
   [[AuthorRequest shareAutorRequest]requestLOLAllAuthorsSuccess:^(NSDictionary *dic) {
  //  NSLog(@" lol dic = %@",dic);
      weakSelf.lolArray = [AuthorModel parseAuthorsWithDic:dic];
       dispatch_async(dispatch_get_main_queue(), ^{
           [weakSelf.lolTableView reloadData];
       });
  } failure:^(NSError *error) {
    NSLog(@"error = %@",error);
   }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.dotaTableView) {
        return self.dotaArray.count;
    }else
    {
    return self.lolArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AuthorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AuthorTableViewCell_Identify];
    AuthorModel *model = nil;
    if (tableView == self.dotaTableView) {
        model = self.dotaArray[indexPath.row];
    }else
    {
        model = self.lolArray[indexPath.row];
    }
    cell.model = model;
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    VideoViewController *videoVC = [sb instantiateViewControllerWithIdentifier:@"VideoViewController"];
   
   
    if (tableView == self.dotaTableView) {
         AuthorModel *model = self.dotaArray[indexPath.row];
         videoVC.authorID = model.authorId;
        videoVC.sourceFrom = 0;
    }else
    {
        AuthorModel *model = self.lolArray[indexPath.row];
        videoVC.authorID = model.authorId;
        videoVC.sourceFrom = 1;
        
    }
    self.rootVC.dbTabBar.hidden = YES;
    [self.navigationController pushViewController:videoVC animated:YES];
    
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
