//
//  HomeCell.m
//  Life
//
//  Created by jie.huang on 31/3/19.
//  Copyright © 2019年 jie.huang. All rights reserved.
//

#import "HomeCell.h"
#import "DataModel.h"
@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(DataModel *)model{
    
    _model = model;
    
    self.Contenlable.text = model.Name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
