//
//  LifeTabBarController.m
//  Life
//
//  Created by jie.huang on 27/3/19.
//  Copyright © 2019年 jie.huang. All rights reserved.
//

#import "LifeTabBarController.h"
#import "LifeNavController.h"
#import "VCModel.h"

@interface LifeTabBarController ()

@end

@implementation LifeTabBarController

+(void)load
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (VCModel *model in [VCModel MTMJParse:[self readLocalFileWithName:jsonDataname]]) {
        [self addChilvc:objc_msgSend(objc_getClass([model.vcName UTF8String]) , sel_registerName([create UTF8String])) title:model.title image:model.imageName selectImage:model.imageNameClick];
    }
}

- (NSArray *)readLocalFileWithName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

-(void)addChilvc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage;
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    LifeNavController *nav = [[LifeNavController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}


@end
