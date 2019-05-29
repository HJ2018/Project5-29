//
//  TableViewDataSource.m
//  MAIHealth
//
//  Created by jie.huang on 26/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

#import "TableViewDataSource.h"
#import "HomeCell.h"

static NSString * const HomeID = @"HomeID";


@interface TableViewDataSource ()

@end

@implementation TableViewDataSource


+(void)registerClass:(UITableView *)table{
    
    [table registerNib:[UINib nibWithNibName:NSStringFromClass([HomeCell class]) bundle:nil] forCellReuseIdentifier:HomeID];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.DataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeID];
    
    cell.backgroundColor = Color_RandomRGB();
    
    cell.model = self.DataArr[indexPath.row];
    
    return cell;
}

@end
