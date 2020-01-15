//
//  ZMJScaleProgressView.h
//  ZMJScaleProgressView
//
//  Created by qx on 2020/1/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJScaleProgressView : UIView

@property (assign, nonatomic) CGFloat zmj_duration;
@property (assign, nonatomic) CGFloat zmj_startAngle;
@property (assign, nonatomic) CGFloat zmj_endAngle;
@property (assign, nonatomic) CGFloat zmj_minValue;
@property (assign, nonatomic) CGFloat zmj_maxValue;
@property (assign, nonatomic) NSInteger zmj_section;
@property (assign, nonatomic) NSInteger zmj_lineNum;
@property (assign, nonatomic) CGFloat zmj_lineWidth;
@property (assign, nonatomic) CGFloat zmj_lineHeight;
@property (assign, nonatomic) CGFloat zmj_linePointHeight;

@property (strong, nonatomic) UIColor *zmj_fillColor;
@property (strong, nonatomic) UIColor *zmj_strokeColor;
@property (strong, nonatomic) UIColor *zmj_textColor;

@property (copy, nonatomic) NSString *zmj_number;

@end

NS_ASSUME_NONNULL_END
