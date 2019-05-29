//
//  NSString+Category.h
//  MAIHealth
//
//  Created by jie.huang on 16/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)


/**
 电话号码中间4位*显示
 
 @param phoneNum 电话号码
 @return 135*****262
 */
+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum;


/**
 *  NSString转为NSNumber
 *
 *  @return NSNumber
 */
- (NSNumber*) toNumber;

/**
 计算文字高度
 
 @param fontSize 字体
 @param width 最大宽度
 @return height
 */
- (CGFloat) heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;

/**
 计算文字宽度
 
 @param fontSize 字体
 @param maxHeight 最大高度
 @return Width
 */
- (CGFloat) widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight;

/**
 抹除小数末尾的0
 
 @return NSString
 */
- (NSString*) removeUnwantedZero;

/**
 点赞数处理：2.1千，3.4万
 
 @param string 传入的 string 类型的 数字
 @return 2.1千，3.4万
 */
+ (NSString *)ba_stringTransformNumberWithString:(NSString *)string;


/**
 给 button 添加下划线
 
 @param button button
 @param range button 的 title 需要加下划线的地方
 @param lineColor 下划线颜色
 */
+ (void)ba_stringToBeUnderlineWithButton:(UIButton *)button
                                   range:(NSRange)range
                               lineColor:(UIColor *)lineColor;





@end
