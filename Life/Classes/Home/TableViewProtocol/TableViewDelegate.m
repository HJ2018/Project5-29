//
//  TableViewDelegate.m
//  MAIHealth
//
//  Created by jie.huang on 26/2/19.
//  Copyright © 2019年 MAITIAN. All rights reserved.
//

#import "TableViewDelegate.h"

@implementation TableViewDelegate



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [[UIViewController currentViewController].navigationController pushViewController:[UIViewController new] animated:YES];
}




@end
