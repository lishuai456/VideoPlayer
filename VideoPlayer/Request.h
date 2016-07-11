//
//  Request.h
//  VideoPlayer
//
//  Created by 李帅 on 16/7/7.
//  Copyright © 2016年 linda. All rights reserved.
//

#ifndef Request_h
#define Request_h

//data全部主播请求 url
#define DotaAllAuthorsRequest_url @"http://api.dotaly.com/api/v1/authors?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"
//dota 单个主播所有视频
#define DotaListRequest(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/shipin/latest?author=%@&iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&limit=50",ID]

#define DotaVideoRequest(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/getvideourl?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&type=mp4&vid=%@3D",ID]


//LOL 全部主播请求
#define LOLAllAutorsRequest_url @"http://api.dotaly.com/lol/api/v1/authors?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E"

//lol 单个主播所有视频 url
#define LOLSignleAuthorAllVideosRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/shipin/latest?author=%@&iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&limit=50", ID]

#define LOLVideoRequest(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/getvideourl?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&type=flv&vid=%@",ID]
#endif /* Request_h */
