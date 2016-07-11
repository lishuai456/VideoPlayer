//
//  VideoDetailRequest.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/9.
//  Copyright © 2016年 linda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface VideoDetailRequest : NSObject

+ (instancetype)shareVideoDetailRequest;

- (void)requestLoLVieoWithVieoID:(NSString *)ID
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure;


- (void)requestDotaVieoWithVieoID:(NSString *)ID
                          success:(SuccessResponse)success
                          failure:(FailureResponse)failure;

@end
