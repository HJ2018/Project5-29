//
//  LifeNavController.m
//  Life
//
//  Created by jie.huang on 27/3/19.
//  Copyright © 2019年 jie.huang. All rights reserved.
//

#import "LifeNavController.h"

@interface LifeNavController ()<UIGestureRecognizerDelegate>

@end

@implementation LifeNavController

+(void)load{
    
    UINavigationBar *navBar =[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:dict];
  
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = YES;
    [self.view addGestureRecognizer:pan];
    
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
}

-(void)handleNavigationTransition:(UIPanGestureRecognizer *)pag{}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem BackButtonItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturn"] target:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}
#pragma mark - <UIGestureRecognizerDelegate>

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

@end
