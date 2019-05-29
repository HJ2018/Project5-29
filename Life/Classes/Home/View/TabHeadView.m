//
//  TabHeadView.m
//  Life
//
//  Created by jie.huang on 31/3/19.
//  Copyright © 2019年 jie.huang. All rights reserved.
//

#import "TabHeadView.h"

@interface TabHeadView ()<SDCycleScrollViewDelegate>

@end

@implementation TabHeadView


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.frame = CGRectMake(0, 0, ScreenW, ScreenW * 0.586);
}


-(void)setUrlArr:(NSArray *)urlArr{
    
    _urlArr = urlArr;
    
    self.BannerView.delegate = self;
    self.BannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.BannerView.titlesGroup = self.TitleArr;
    self.BannerView.currentPageDotColor = [UIColor whiteColor];
    self.BannerView.imageURLStringsGroup = self.urlArr;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}

@end
