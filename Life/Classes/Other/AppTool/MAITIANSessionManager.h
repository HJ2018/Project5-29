//
//  MAITIANSessionManager.h
//  MAIHealth
//
//  Created by jie.huang on 14/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef enum{
    RequestTypeGet,
    RequestTypePost
    
}RequestType;


@interface MAITIANSessionManager : NSObject

+(instancetype)sharedInstance;

- (void)hudShow;
- (void)hudHide;

- (void)request:(RequestType)requestType
         urlStr: (NSString *)urlStr
      parameter: (NSDictionary *)param
      withToken:(BOOL)withToken
    withHUDShow:(BOOL)withHUDShow
    withHUDHide:(BOOL)withHUDHide
    resultBlock: (void(^)(id responseObject, NSError *error))resultBlock;

- (void)request:(RequestType)requestType
         urlStr: (NSString *)urlStr
      parameter: (NSDictionary *)param
      withToken:(BOOL)withToken
    withHUDShow:(BOOL)withHUDShow
    withHUDHide:(BOOL)withHUDHide
        success:(void(^)(id responseObj))success
        failure:(void(^)(NSError *error))failure;

@end
