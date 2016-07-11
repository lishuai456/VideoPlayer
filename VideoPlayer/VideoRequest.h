//
//  VideoRequest.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/8.
//  Copyright © 2016年 linda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface VideoRequest : NSObject

+(instancetype)shareVideoRequest;

- (void)requestDotaSingleAuthorAllVideoWithAuThorID:(NSString *)ID
                                      Success:(SuccessResponse)success
                                      failure:(FailureResponse)failure;

-(void)requestLOLSingleAuthorAllVideoWithAuthorID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure;

@end
