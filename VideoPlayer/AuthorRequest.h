//
//  AuthorRequest.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "BaseRequest.h"
#import "NetWorkRequest.h"
@interface AuthorRequest : BaseRequest

+(instancetype)shareAutorRequest;

- (void)requestDotaAllAuthorsSuccess:(SuccessResponse)success
                             failure:(FailureResponse)failure;

- (void)requestLOLAllAuthorsSuccess:(SuccessResponse)success
                            failure:(FailureResponse)failure;


- (void)requestAllAuthorsWithUrl:(NSString *)url
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure;

@end
