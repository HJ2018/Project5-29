

NSString *const  jsonDataname = @"MainVCSettings";

NSString *const create = @"new";

/** 公共的URL */
NSString * const CommonURL = @"http://api.MeHuang.com/";

NSString *const  HOME_URL = @"Home";




UIColor *Color_RandomRGB(){
    return Color_RGBValue(arc4random_uniform(0xffffff));
}

UIColor *Color_RandomRGBA(){
    return Color_RGBAValue(arc4random_uniform(0xffffffff));
}

UIColor *Color_RGBValue(UInt32 rgbValue){
    return [UIColor colorWithRed:((rgbValue & 0xff0000) >> 16) / 255.0f
                           green:((rgbValue & 0xff00) >> 8) / 255.0f
                            blue:(rgbValue  & 0xff) / 255.0f
                           alpha:1.0f];
}

UIColor *Color_RGBAValue(UInt32 rgbaValue){
    return [UIColor colorWithRed:((rgbaValue & 0xff000000) >> 24) / 255.0f
                           green:((rgbaValue & 0xff0000) >> 16) / 255.0f
                            blue:((rgbaValue & 0xff00) >> 8) / 255.0f
                           alpha:(rgbaValue  & 0xff) / 255.0f];
}

UIColor *Color_RGB(u_char r,u_char g, u_char b){
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}

UIColor *Color_RGBA(u_char r,u_char g, u_char b, u_char a){
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a/255.0f];
}


UIColor *Color_Gray;

UIColor *KTintGreenColor;





@interface NSObject(MAITIANConst)

@end

@implementation NSObject(MAITIANConst)

+ (void)load{
    
    Color_Gray = Color_RGB(236, 237, 232);
    
    KTintGreenColor = Color_RGB(0, 184, 163);
}


@end
