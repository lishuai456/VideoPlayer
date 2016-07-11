//
//  NetWorkRequest.h
//  豆瓣项目
//
//  Created by 李帅 on 16/6/27.
//  Copyright © 2016年 linda. All rights reserved.
//

#import "BaseRequest.h"

//成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);
//失败回调
typedef void(^FailureResponse)(NSError *error);


@interface NetWorkRequest : BaseRequest


/**
 *
 *  @param url          请求数据url
 *  @param parameterDic 请求的参数
 *  @param success      成功回调block
 *  @param Failure      失败回调block
 */
- (void)requesWithUrl:(NSString *)url
           parameters:(NSDictionary *)parameterDic
      SuccessResponse:(SuccessResponse)success
      failureResponse:(FailureResponse)failure;

- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse)failure;

- (void)sendImageWithUrl:(NSString *)url
               parameter:(NSDictionary *)paremeterDic
                   image:(UIImage *)uploadImage
         successResponse:(SuccessResponse)success
         failureResponse:(FailureResponse)failure;


@end
