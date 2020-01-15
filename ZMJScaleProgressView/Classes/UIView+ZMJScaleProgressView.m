//
//  UIView+ZMJScaleProgressView.m
//  ZMJScaleProgressView
//
//  Created by qx on 2020/1/10.
//

#import "UIView+ZMJScaleProgressView.h"

@implementation UIView (ZMJScaleProgressView)

- (void)setZmj_width:(CGFloat)zmj_width {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.size.width = zmj_width;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_width {
    
    return self.frame.size.width;
}

- (void)setZmj_height:(CGFloat)zmj_height {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.size.height = zmj_height;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_height {
    
    return self.frame.size.height;
}

- (void)setZmj_x:(CGFloat)zmj_x {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.origin.x = zmj_x;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_x {
    
    return self.frame.origin.x;
}

- (void)setZmj_y:(CGFloat)zmj_y {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.origin.y = zmj_y;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_y {
    
    return self.frame.origin.y;
}

- (void)setZmj_centerX:(CGFloat)zmj_centerX {
    
    CGPoint zmj_rect = self.center;
    zmj_rect.x = zmj_centerX;
    self.center = zmj_rect;
}

- (CGFloat)zmj_centerX {
    
    return self.center.x;
}

- (void)setZmj_centerY:(CGFloat)zmj_centerY {
    
    CGPoint zmj_rect = self.center;
    zmj_rect.y = zmj_centerY;
    self.center = zmj_rect;
}

- (CGFloat)zmj_centerY {
    
    return self.center.y;
}

+ (void)zmj_animationScaleProgressViewShapeLayer:(CAShapeLayer *)shapeLayer zmj_duration:(CGFloat)duration {
    
    CABasicAnimation *zmj_basicAnimation = [CABasicAnimation animation];
    zmj_basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    zmj_basicAnimation.duration = duration;
    zmj_basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    zmj_basicAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    zmj_basicAnimation.toValue = [NSNumber numberWithFloat:shapeLayer.strokeEnd];
    zmj_basicAnimation.removedOnCompletion = NO;
    zmj_basicAnimation.fillMode = kCAFillModeForwards;

    [shapeLayer addAnimation:zmj_basicAnimation forKey:@"zmj_basicAnimation"];
}

+ (void)zmj_animationScaleProgressViewShapeLayer:(CAShapeLayer *)shapeLayer zmj_duration1:(CGFloat)duration1 zmj_duration2:(CGFloat)duration2 {
    
    CABasicAnimation *zmj_basicAnimation1 = [CABasicAnimation animation];
    zmj_basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    zmj_basicAnimation1.duration = duration1;
    zmj_basicAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    zmj_basicAnimation1.fromValue = [NSNumber numberWithFloat:0.0f];
    zmj_basicAnimation1.toValue = [NSNumber numberWithFloat:1.0f];
    zmj_basicAnimation1.removedOnCompletion = NO;
    zmj_basicAnimation1.fillMode = kCAFillModeForwards;

    CABasicAnimation *zmj_basicAnimation2 = [CABasicAnimation animation];
    zmj_basicAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    zmj_basicAnimation2.beginTime = duration1;
    zmj_basicAnimation2.duration = duration2;
    zmj_basicAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    zmj_basicAnimation2.fromValue = [NSNumber numberWithFloat:1.0f];
    zmj_basicAnimation2.toValue = [NSNumber numberWithFloat:shapeLayer.strokeEnd];
    zmj_basicAnimation2.removedOnCompletion = NO;
    zmj_basicAnimation2.fillMode = kCAFillModeForwards;

    CAAnimationGroup *zmj_animationGroup = [CAAnimationGroup animation];
    zmj_animationGroup.duration = duration1 + duration2;
    zmj_animationGroup.autoreverses = NO;
    zmj_animationGroup.removedOnCompletion = NO;
    zmj_animationGroup.repeatCount = 1;
    zmj_animationGroup.animations = @[zmj_basicAnimation1, zmj_basicAnimation2];

    [shapeLayer addAnimation:zmj_animationGroup forKey:@"zmj_animationGroup"];
}

@end
