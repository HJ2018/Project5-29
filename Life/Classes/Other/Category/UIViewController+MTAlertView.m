//
//  UIViewController+MTAlertView.m
//  MAIHealth
//
//  Created by jie.huang on 14/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

#import "UIViewController+MTAlertView.h"

@implementation UIViewController (MTAlertView)


#pragma mark - AlertView

- (void)alertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
