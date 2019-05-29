//
//  UIViewController+Extended.m
//  Life
//
//  Created by jie.huang on 31/3/19.
//  Copyright © 2019年 jie.huang. All rights reserved.
//

#import "UIViewController+Extended.h"

@implementation UIViewController (Extended)


+ (UIViewController*)currentViewController{
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end
