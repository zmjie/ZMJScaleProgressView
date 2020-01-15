//
//  ZMJScaleProgressView.m
//  ZMJScaleProgressView
//
//  Created by qx on 2020/1/10.
//

#import "ZMJScaleProgressView.h"

#import "ZMJScaleProgressView_Macro.h"

#import "UIColor+ZMJScaleProgressView.h"
#import "UIView+ZMJScaleProgressView.h"

@interface ZMJScaleProgressView ()

@property (strong, nonatomic) CAShapeLayer *zmj_shapeLayer1;
@property (strong, nonatomic) CAShapeLayer *zmj_shapeLayer2;

@property (strong, nonatomic) UIBezierPath *zmj_bezierPath3;
@property (strong, nonatomic) UIBezierPath *zmj_bezierPath4;

@end

@implementation ZMJScaleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.frame = frame;
        
        [self zmj_m_initView];
        
        [self layoutIfNeeded];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.zmj_width == 0) {
        return;
    }
    
    [_zmj_bezierPath3 removeAllPoints];
    [_zmj_bezierPath4 removeAllPoints];
    
    for (int i = 0; i < _zmj_lineNum + 1; i++) {

        CGFloat zmj_startA = _zmj_startAngle + (_zmj_endAngle - _zmj_startAngle) / _zmj_lineNum * i;

        CGFloat zmj_point1X = self.zmj_width / 2 + ((self.zmj_width / 2 - _zmj_linePointHeight) * cosf(zmj_startA));
        CGFloat zmj_point1Y = self.zmj_width / 2 + ((self.zmj_width / 2 - _zmj_linePointHeight) * sinf(zmj_startA));

        CGFloat zmj_point2X = self.zmj_width / 2 + (self.zmj_width / 2 - _zmj_linePointHeight + _zmj_lineHeight) * cosf(zmj_startA);
        CGFloat zmj_point2Y = self.zmj_width / 2 + (self.zmj_width / 2 - _zmj_linePointHeight + _zmj_lineHeight) * sinf(zmj_startA);

        if (i % (_zmj_lineNum / _zmj_section) == 0) {

            zmj_point2X = self.zmj_width / 2 + (self.zmj_width / 2 - _zmj_linePointHeight + _zmj_linePointHeight) * cosf(zmj_startA);
            zmj_point2Y = self.zmj_width / 2 + (self.zmj_width / 2 - _zmj_linePointHeight + _zmj_linePointHeight) * sinf(zmj_startA);
        }

        [_zmj_bezierPath3 moveToPoint:CGPointMake(zmj_point1X, zmj_point1Y)];
        [_zmj_bezierPath3 addLineToPoint:CGPointMake(zmj_point2X, zmj_point2Y)];

        [_zmj_bezierPath4 moveToPoint:CGPointMake(zmj_point1X, zmj_point1Y)];
        [_zmj_bezierPath4 addLineToPoint:CGPointMake(zmj_point2X, zmj_point2Y)];
    }

    _zmj_shapeLayer1.path = _zmj_bezierPath3.CGPath;
    _zmj_shapeLayer2.path = _zmj_bezierPath4.CGPath;
    
    NSArray *zmj_subViews = self.subviews;
    
    [zmj_subViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        if ([obj isKindOfClass:[UILabel class]]) {

            UILabel *zmj_label = (UILabel *)self.subviews[idx];

            CGFloat zmj_startA = _zmj_startAngle + (_zmj_endAngle - _zmj_startAngle) / _zmj_section * idx;

            CGFloat zmj_centerX = self.zmj_width / 2 + (self.zmj_width / 2 - self.zmj_linePointHeight - zmj_size(12.5)) * cosf(zmj_startA);
            CGFloat zmj_centerY = self.zmj_width / 2 + (self.zmj_width / 2 - self.zmj_linePointHeight - zmj_size(12.5)) * sinf(zmj_startA);

            zmj_label.center = CGPointMake(zmj_centerX, zmj_centerY);
            zmj_label.bounds = CGRectMake(0, 0, zmj_size(60), zmj_size(60));
        }
    }];
}

- (void)setZmj_duration:(CGFloat)zmj_duration {
    
    _zmj_duration = zmj_duration;
}

- (void)setZmj_startAngle:(CGFloat)zmj_startAngle {
    
    _zmj_startAngle = zmj_startAngle;
}

- (void)setZmj_endAngle:(CGFloat)zmj_endAngle {
    
    _zmj_endAngle = zmj_endAngle;
}

- (void)setZmj_minValue:(CGFloat)zmj_minValue {
    
    _zmj_minValue = zmj_minValue;
}

- (void)setZmj_maxValue:(CGFloat)zmj_maxValue {
    
    _zmj_maxValue = zmj_maxValue;
}

- (void)setZmj_section:(NSInteger)zmj_section {
    
    _zmj_section = zmj_section;
    
    NSArray *zmj_subViews = self.subviews;
    
    for (int i = 0; i < _zmj_section + 1; i++) {
        
        if (i < zmj_subViews.count) {
            
            if ([zmj_subViews[i] isKindOfClass:[UILabel class]]) {
                
                UILabel *zmj_label = (UILabel *)zmj_subViews[i];
                
                zmj_label.hidden = NO;
                zmj_label.text = [NSString stringWithFormat:@"%.0f", _zmj_minValue + ((_zmj_maxValue - _zmj_minValue) / _zmj_section) * i];
            }
        }else {
            
            UILabel *zmj_label = [[UILabel alloc] init];
            zmj_label.textColor = [UIColor zmj_dynamicColor:[UIColor blackColor] zmj_darkColor:[UIColor blackColor]];
            zmj_label.font = zmj_fontNameSize(@"DINCondensed-Bold", 12.0f);
            zmj_label.textAlignment = NSTextAlignmentCenter;
            zmj_label.text = [NSString stringWithFormat:@"%.0f", _zmj_minValue + ((_zmj_maxValue - _zmj_minValue) / _zmj_section) * i];
            [self addSubview:zmj_label];
        }
    }
}

- (void)setZmj_lineNum:(NSInteger)zmj_lineNum {
    
    _zmj_lineNum = zmj_lineNum;
}

- (void)setZmj_lineWidth:(CGFloat)zmj_lineWidth {
    
    _zmj_lineWidth = zmj_lineWidth;
    
    _zmj_shapeLayer1.lineWidth = _zmj_lineWidth;
    _zmj_shapeLayer2.lineWidth = _zmj_lineWidth;
}

- (void)setZmj_lineHeight:(CGFloat)zmj_lineHeight {
    
    _zmj_lineHeight = zmj_lineHeight;
}

- (void)setZmj_linePointHeight:(CGFloat)zmj_linePointHeight {
    
    _zmj_linePointHeight = zmj_linePointHeight;
}

- (void)setZmj_fillColor:(UIColor *)zmj_fillColor {
    
    _zmj_fillColor = zmj_fillColor;
    
    _zmj_shapeLayer1.strokeColor = _zmj_fillColor.CGColor;
}

- (void)setZmj_strokeColor:(UIColor *)zmj_strokeColor {
    
    _zmj_strokeColor = zmj_strokeColor;
    
    _zmj_shapeLayer2.strokeColor = _zmj_strokeColor.CGColor;
}

- (void)setZmj_textColor:(UIColor *)zmj_textColor {
    
    _zmj_textColor = zmj_textColor;
    
    NSArray *zmj_subViews = self.subviews;
        
    [zmj_subViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        if ([obj isKindOfClass:[UILabel class]]) {

            UILabel *zmj_label = (UILabel *)self.subviews[idx];
            
            zmj_label.textColor = self.zmj_textColor;
        }
    }];
}

- (void)setZmj_number:(NSString *)zmj_number {
    
    _zmj_number = zmj_number;
    
    [_zmj_shapeLayer2 removeAnimationForKey:@"zmj_basicAnimation"];

    if ([_zmj_number integerValue] - _zmj_minValue == 0) {

        _zmj_shapeLayer2.strokeEnd = 0.0f;
        return;
    }

    if ([_zmj_number integerValue] >= _zmj_maxValue) {

        _zmj_shapeLayer2.strokeEnd = 1.0f;

        [self.class zmj_animationScaleProgressViewShapeLayer:_zmj_shapeLayer2 zmj_duration:_zmj_shapeLayer2.strokeEnd];

    }else {

        NSInteger zmj_index = [[NSString stringWithFormat:@"%f", ([_zmj_number floatValue] - _zmj_minValue) / (_zmj_maxValue - _zmj_minValue) * _zmj_lineNum] integerValue];

        CGFloat zmj_end = (_zmj_lineHeight * (zmj_index + 1) + (_zmj_linePointHeight - _zmj_lineHeight) * (zmj_index / (_zmj_lineNum / _zmj_section) + 1)) / (_zmj_lineHeight * (_zmj_lineNum + 1) + (_zmj_linePointHeight - _zmj_lineHeight) * (_zmj_section + 1));
        
        _zmj_shapeLayer2.strokeEnd = zmj_end;
        
        CGFloat zmj_duration = ((_zmj_lineNum + 1) - zmj_index) * _zmj_duration / (_zmj_lineNum + 1);
        
        [self.class zmj_animationScaleProgressViewShapeLayer:_zmj_shapeLayer2 zmj_duration1:_zmj_duration zmj_duration2:zmj_duration];
    }
}

- (void)zmj_m_initView {
    
    [self.layer addSublayer:self.zmj_shapeLayer1];
    [self.layer addSublayer:self.zmj_shapeLayer2];
    
    for (int i = 0; i < 5; i++) {
        
        UILabel *zmj_label = [[UILabel alloc] init];
        zmj_label.textColor = [UIColor zmj_dynamicColor:[UIColor blackColor] zmj_darkColor:[UIColor blackColor]];
        zmj_label.font = zmj_fontNameSize(@"DINCondensed-Bold", 12.0f);
        zmj_label.textAlignment = NSTextAlignmentCenter;
        zmj_label.hidden = YES;
        [self addSubview:zmj_label];
    }
}

- (CAShapeLayer *)zmj_shapeLayer1 {
    if (!_zmj_shapeLayer1) {
        _zmj_shapeLayer1 = [CAShapeLayer layer];
        _zmj_shapeLayer1.path = self.zmj_bezierPath3.CGPath;
        _zmj_shapeLayer1.fillColor = [UIColor zmj_dynamicColor:[UIColor clearColor] zmj_darkColor:[UIColor clearColor]].CGColor;
        _zmj_shapeLayer1.strokeEnd = 1.0f;
    }
    return _zmj_shapeLayer1;
}

- (CAShapeLayer *)zmj_shapeLayer2 {
    if (!_zmj_shapeLayer2) {
        _zmj_shapeLayer2 = [CAShapeLayer layer];
        _zmj_shapeLayer2.path = self.zmj_bezierPath4.CGPath;
        _zmj_shapeLayer2.fillColor = [UIColor zmj_dynamicColor:[UIColor clearColor] zmj_darkColor:[UIColor clearColor]].CGColor;
        _zmj_shapeLayer2.strokeEnd = 0.0f;
    }
    return _zmj_shapeLayer2;
}

- (UIBezierPath *)zmj_bezierPath3 {
    if (!_zmj_bezierPath3) {
        _zmj_bezierPath3 = [UIBezierPath bezierPath];
    }
    return _zmj_bezierPath3;
}

- (UIBezierPath *)zmj_bezierPath4 {
    if (!_zmj_bezierPath4) {
        _zmj_bezierPath4 = [UIBezierPath bezierPath];
    }
    return _zmj_bezierPath4;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
