//
//  NSString+Category.m
//  MAIHealth
//
//  Created by jie.huang on 16/8/18.
//  Copyright © 2018年 MAITIAN. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)


+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum
{
    if (phoneNum.length==11) {
        NSMutableString *newStr = [NSMutableString stringWithString:phoneNum];
        NSRange range = NSMakeRange(3, 7);
        [newStr replaceCharactersInRange:range withString:@"*****"];
        return newStr;
    }
    return nil;
}

-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

- (CGFloat) widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(0, maxHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.width;
}

- (NSNumber*)toNumber
{
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number=[formatter numberFromString:self];
    return number;
}

/*抹除运费小数末尾的0*/
- (NSString *)removeUnwantedZero {
    if ([[self substringWithRange:NSMakeRange(self.length- 3, 3)] isEqualToString:@"000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-4)]; // 多一个小数点
    } else if ([[self substringWithRange:NSMakeRange(self.length- 2, 2)] isEqualToString:@"00"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-2)];
    } else if ([[self substringWithRange:NSMakeRange(self.length- 1, 1)] isEqualToString:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-1)];
    } else {
        return self;
    }
}

+ (NSString *)ba_stringTransformNumberWithString:(NSString *)string
{
    float number = [string integerValue];
    
    NSString *numberString = @"";
    if (number < 1000)
    {
        numberString = [NSString stringWithFormat:@"%.0f", number];
    }
    else
        if (number / 1000 && number / 10000 < 1)
        {
            numberString = [NSString stringWithFormat:@"%.1f千", number/1000];
        }
        else
        {
            numberString = [NSString stringWithFormat:@"%.1f万", number/10000];
        }
    
    return numberString;
}

+ (void)ba_stringToBeUnderlineWithButton:(UIButton *)button
                                   range:(NSRange)range
                               lineColor:(UIColor *)lineColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
    [str addAttribute:NSUnderlineColorAttributeName value:lineColor range:range];
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [button setAttributedTitle:str forState:UIControlStateNormal];
}



@end
