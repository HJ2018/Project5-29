//
//  MAITIANSessionManager.m
//  MAIHealth
//
//  Created by jie.huang on 14/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

#import "MAITIANSessionManager.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "AppDelegate.h"

@interface MAITIANSessionManager()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation MAITIANSessionManager



static MAITIANSessionManager *instance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}


-(void)hudShow{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:delegate.window animated:YES];
    hud.contentColor = [UIColor colorWithRed:0.f green:0.6f blue:0.7f alpha:1.f];
    hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
}

-(void)hudHide{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [MBProgressHUD hideHUDForView:delegate.window animated:YES];
}

- (void)setValue:(NSString *)value forHttpField:(NSString *)field {
    [self.sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}

-(AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        NSMutableSet *setM = [_sessionManager.responseSerializer.acceptableContentTypes mutableCopy];
        [setM addObject:@"text/plain"];
        [setM addObject:@"text/html"];
        _sessionManager.responseSerializer.acceptableContentTypes = [setM copy];
    }
    return _sessionManager;
}


-(void)request:(RequestType)requestType urlStr:(NSString *)urlStr parameter:(NSDictionary *)param withToken:(BOOL)withToken withHUDShow:(BOOL)withHUDShow withHUDHide:(BOOL)withHUDHide resultBlock:(void (^)(id, NSError *))resultBlock{
    
    
    if (withHUDShow) {
        [self hudShow];
    }
    
    if (withToken) {
//        [self setValue:@"" forHttpField:@"token"];
        [param setValue:@"toke" forKey:@"token"];
    }
    
    void(^successBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultBlock(responseObject, nil);
        if (withHUDHide) {
            [self hudHide];
        }
    };
    void(^failBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        resultBlock(nil, error);
        if (withHUDHide) {
            [self hudHide];
        }
    };
    
    if (requestType == RequestTypeGet) {
        [self.sessionManager GET:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    }else {
        [self.sessionManager POST:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    }
}

-(void)request:(RequestType)requestType urlStr:(NSString *)urlStr parameter:(NSDictionary *)param withToken:(BOOL)withToken withHUDShow:(BOOL)withHUDShow withHUDHide:(BOOL)withHUDHide success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    if (withHUDShow) {
        [self hudShow];
    }
    
    if (withToken) {

        [param setValue:@"toke" forKey:@"token"];
    }
    
    void(^successBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
        if (withHUDHide) {
            [self hudHide];
        }
        
        NSLog(@"success======%@",responseObject);
    };
    void(^failBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
        if (withHUDHide) {
            [self hudHide];
        }
        
        NSLog(@"failure======%@",error);
    };
    
    NSMutableString *finalUrl = [[NSMutableString alloc] initWithString:CommonURL];
    [finalUrl appendString:urlStr];
    NSLog(@"url--------->%@",finalUrl);
    
    if (requestType == RequestTypeGet) {
        
        NSLog(@"formParams ======>GET #####%@",param);
        
        [self.sessionManager GET:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    }else {
        
         NSLog(@"queryParams ======>POST #####%@",param);
        
        [self.sessionManager POST:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    }
    
}





@end
