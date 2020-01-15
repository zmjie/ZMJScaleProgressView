//
//  ZMJScaleProgressView_Macro.h
//  ZMJScaleProgressView
//
//  Created by qx on 2020/1/10.
//

#ifndef ZMJScaleProgressView_Macro_h
#define ZMJScaleProgressView_Macro_h

// 屏幕宽度
#define zmj_screenWidth (int)MIN([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)

// rgb颜色转换（16进制->10进制）
#define zmj_colorFromRGB(rgbValue) zmj_colorFromRGBa(rgbValue, 1.0)

#define zmj_colorFromRGBa(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

// RGB颜色值
#define zmj_color(r, g, b) zmj_colora(r, g, b, 1.0)

#define zmj_colora(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

// 距离比例
#define zmj_size(R) (zmj_ratio * R)

// 屏幕宽比例
#define zmj_ratio (zmj_screenWidth / 375.0)

// 字体大小比例
#define zmj_fontNameSize(name, R) [UIFont fontWithName:(name) size:(zmj_ratio * R)]

#endif /* ZMJScaleProgressView_Macro_h */
