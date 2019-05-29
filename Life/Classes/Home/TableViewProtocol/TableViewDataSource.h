//
//  TableViewDataSource.h
//  MAIHealth
//
//  Created by jie.huang on 26/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DataModel.h"
@interface TableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic,strong) NSArray<DataModel *> *DataArr;

+(void)registerClass:(UITableView *)table;

@end
