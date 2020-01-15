//
//  UIView+ZMJScaleProgressView.h
//  ZMJScaleProgressView
//
//  Created by qx on 2020/1/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZMJScaleProgressView)

@property (assign, nonatomic) CGFloat zmj_width;

@property (assign, nonatomic) CGFloat zmj_height;

@property (assign, nonatomic) CGFloat zmj_x;

@property (assign, nonatomic) CGFloat zmj_y;

@property (assign, nonatomic) CGFloat zmj_centerX;

@property (assign, nonatomic) CGFloat zmj_centerY;

+ (void)zmj_animationScaleProgressViewShapeLayer:(CAShapeLayer *)shapeLayer zmj_duration:(CGFloat)duration;

+ (void)zmj_animationScaleProgressViewShapeLayer:(CAShapeLayer *)shapeLayer zmj_duration1:(CGFloat)duration1 zmj_duration2:(CGFloat)duration2;

@end

NS_ASSUME_NONNULL_END
