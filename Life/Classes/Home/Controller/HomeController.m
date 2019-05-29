//
//  HomeController.m
//  Life
//
//  Created by jie.huang on 27/3/19.
//  Copyright © 2019年 jie.huang. All rights reserved.
//

#import "HomeController.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "TableViewModel.h"
#import "SDCycleScrollView.h"
#import "TabHeadView.h"

@interface HomeController ()

@property (nonatomic, strong) TableViewDataSource *TabDataSource;

@property (nonatomic, strong) TableViewDelegate *TabDelegate;

@property (nonatomic, strong) TableViewModel *DataModel;

@property (nonatomic, strong) TabHeadView *TabHeadView;

@end

@implementation HomeController

-(TableViewDataSource *)TabDataSource{
    if (!_TabDataSource) {
        _TabDataSource = [TableViewDataSource new];
        self.tableView.dataSource = _TabDataSource;
    }
    return _TabDataSource;
}

-(TableViewDelegate *)TabDelegate{
    if (!_TabDelegate) {
        _TabDelegate = [TableViewDelegate new];
        self.tableView.delegate = _TabDelegate;
    }
    return _TabDelegate;
}

-(TableViewModel *)DataModel{
    if (!_DataModel) {
        
        _DataModel = [TableViewModel new];
    }
    return _DataModel;
}

-(TabHeadView *)TabHeadView{
    
    if (!_TabHeadView) {
        
        _TabHeadView = [TabHeadView viewFromxib];
    }
    return _TabHeadView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.tableFooterView = [UIView new];
    [TableViewDataSource  registerClass:self.tableView];
    
    self.tableView.tableHeaderView = self.TabHeadView;
    
    [self setupRefresh];
}

-(void)setupRefresh
{
    if ([self.tableView.mj_header isRefreshing]) return;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    
}
-(void)loadNewTopics{
    
    [self getDataisHead:YES];
}
-(void)loadMoreTopics{
    
    [self getDataisHead:NO];
}

-(void)getDataisHead:(BOOL)isHead{
    
    WEAKSELF
    [self.DataModel TableViewData:^(NSMutableArray<DataModel *> *Contentarry) {
        weakSelf.TabDataSource.DataArr = Contentarry;
        weakSelf.TabDelegate.DataArr = Contentarry;
        [weakSelf.tableView reloadData];
        isHead ? [self.tableView.mj_header endRefreshing] : [self.tableView.mj_footer endRefreshing];
    } headBanner:^(NSArray *bannerArry, NSArray *titlearry) {
        weakSelf.TabHeadView.TitleArr = titlearry;
        weakSelf.TabHeadView.urlArr = bannerArry;
        isHead ? [self.tableView.mj_header endRefreshing] : [self.tableView.mj_footer endRefreshing];
    }];
}




@end
