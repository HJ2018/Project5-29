//
//  UIButton+Category.h
//  MAIHealth
//
//  Created by jie.huang on 16/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

typedef void (^TouchedBlock)(NSInteger tag);


@interface UIButton (Category)

/**
 添加 addtarget
 */
- (void)addActionHandler:(TouchedBlock)touchHandler;

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
