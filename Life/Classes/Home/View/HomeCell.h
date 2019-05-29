//
//  HomeCell.h
//  Life
//
//  Created by jie.huang on 31/3/19.
//  Copyright © 2019年 jie.huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;
NS_ASSUME_NONNULL_BEGIN

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Contenlable;

@property (nonatomic,strong) DataModel *model;

@end

NS_ASSUME_NONNULL_END
