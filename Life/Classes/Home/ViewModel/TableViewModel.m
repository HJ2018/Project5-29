//
//  TableViewModel.m
//  MAIHealth
//
//  Created by jie.huang on 26/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

#import "TableViewModel.h"
#import "DataModel.h"

@interface TableViewModel()

@property (nonatomic, strong) NSMutableArray<DataModel *> *ContentData;
@property (nonatomic, strong) NSMutableArray *BannerArry;


@end

@implementation TableViewModel



- (void)TableViewData:(callback)callback headBanner:(headBack)headBack{
 
    NSMutableDictionary *queryParams = [NSMutableDictionary dictionary];
    [queryParams setObject:@"dev" forKey:@"home"];
    
    [[MAITIANSessionManager sharedInstance]request:RequestTypePost urlStr:HOME_URL parameter:queryParams withToken:YES withHUDShow:YES withHUDHide:YES success:^(id responseObj) {
        self.ContentData = [DataModel MTMJParse:responseObj[@"Tab"]];
        self.BannerArry = responseObj[@"banner"];
        callback(self.ContentData);
        headBack(self.BannerArry , responseObj[@"bannerTitle"]);
    } failure:^(NSError *error) {
        
    }];
}

@end
