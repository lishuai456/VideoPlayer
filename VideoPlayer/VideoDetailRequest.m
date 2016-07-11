//
//  VideoDetailRequest.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/9.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "VideoDetailRequest.h"

static VideoDetailRequest *request = nil;

@implementation VideoDetailRequest

+(instancetype)shareVideoDetailRequest
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VideoDetailRequest alloc]init];
    });
    return request;
}

- (void)requestDotaVieoWithVieoID:(NSString *)ID
                          success:(SuccessResponse)success
                          failure:(FailureResponse)failure
{
    [self requestVideoWithUrl:DotaVideoRequest(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)requestLoLVieoWithVieoID:(NSString *)ID
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure
{
    [self requestVideoWithUrl:LOLVideoRequest(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


- (void)requestVideoWithUrl:(NSString *)url
                    success:(SuccessResponse)success
                    failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requesWithUrl:url parameters:nil SuccessResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
