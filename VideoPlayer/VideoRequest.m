//
//  VideoRequest.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "VideoRequest.h"

static VideoRequest *request =  nil;

@implementation VideoRequest


+(instancetype)shareVideoRequest
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    request = [[VideoRequest alloc]init];
  });
    return request;
}

-(void)requestLOLSingleAuthorAllVideoWithAuthorID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure
{
    [self requestStringAutorAllVideoWithUrl:LOLSignleAuthorAllVideosRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}



- (void)requestDotaSingleAuthorAllVideoWithAuThorID:(NSString *)ID
                                      Success:(SuccessResponse)success
                                      failure:(FailureResponse)failure
{
[self requestStringAutorAllVideoWithUrl:DotaListRequest(ID) success:^(NSDictionary *dic) {
    success(dic);
} failure:^(NSError *error) {
    failure(error);
}];
}


- (void)requestStringAutorAllVideoWithUrl:(NSString *)url
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
