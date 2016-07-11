//
//  AuthorRequest.m
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "AuthorRequest.h"
#import "NetWorkRequest.h"
 static AuthorRequest *request = nil;
@implementation AuthorRequest

+(instancetype)shareAutorRequest
{
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[AuthorRequest alloc]init];
    });
    return request;
}

//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    @synchronized(request) {
//        if (!request) {
//            request = [super allocWithZone:zone];
//        }
//    }
//    
//    return request;
//}
//
//+ (instancetype)copyWithZone:(struct _NSZone *)zone
//{
//    
//    return request;
//}




//请求Dota的全部主播
- (void)requestDotaAllAuthorsSuccess:(SuccessResponse)success
                             failure:(FailureResponse)failure
{
    [self requestAllAuthorsWithUrl:DotaAllAuthorsRequest_url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];

}

//请求LOL的全部主播
- (void)requestLOLAllAuthorsSuccess:(SuccessResponse)success
                            failure:(FailureResponse)failure
{
    [self requestAllAuthorsWithUrl:LOLAllAutorsRequest_url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];

}

- (void)requestAllAuthorsWithUrl:(NSString *)url
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
