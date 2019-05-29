//
//  UIViewController+MTAlertView.h
//  MAIHealth
//
//  Created by jie.huang on 14/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface UIViewController (MTAlertView)


- (void)alertWithTitle:(NSString *)title message:(NSString *)message;

- (void)alertWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler;

@end
