//
//  NSObject+MJParse.m
//  MAIHealth
//
//  Created by jie.huang on 14/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

#import "NSObject+MJParse.h"

@implementation NSObject (MJParse)


+ (id)MTMJParse:(id)responseObj
{
    if ([responseObj isKindOfClass:[NSArray class]])
    {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]])
    {
        return [self mj_objectWithKeyValues:responseObj];
    }
    
    return responseObj;
}



@end
