//
//  ZMJViewController.m
//  ZMJScaleProgressView
//
//  Created by zmjie on 01/10/2020.
//  Copyright (c) 2020 zmjie. All rights reserved.
//

#import "ZMJViewController.h"

#import <Masonry/Masonry.h>

#import <ZMJScaleProgressView/ZMJScaleProgressView_Macro.h>
#import <ZMJScaleProgressView/ZMJScaleProgressView.h>
#import <ZMJScaleProgressView/UIColor+ZMJScaleProgressView.h>

@interface ZMJViewController ()

@property (weak, nonatomic) IBOutlet UILabel *zmj_titleLabel;

@property (strong, nonatomic) ZMJScaleProgressView *zmj_scaleProgressView;

@end

@implementation ZMJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self zmj_initView];
    [self zmj_makeSubViewsConstraints];
}

- (void)zmj_initView {
    
    [self.view addSubview:self.zmj_scaleProgressView];
}

- (void)zmj_makeSubViewsConstraints {
    
    [_zmj_scaleProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).offset(-zmj_size(50));
        make.leading.equalTo(self.view).offset(zmj_size(60));
        make.trailing.equalTo(self.view).offset(-zmj_size(60));
        make.height.equalTo(self.zmj_scaleProgressView.mas_width);
    }];
}

- (ZMJScaleProgressView *)zmj_scaleProgressView {
    if (!_zmj_scaleProgressView) {
        _zmj_scaleProgressView = [[ZMJScaleProgressView alloc] initWithFrame:CGRectZero];
        _zmj_scaleProgressView.zmj_duration = 0.75f;
        _zmj_scaleProgressView.zmj_startAngle = M_PI - M_PI / 6;
        _zmj_scaleProgressView.zmj_endAngle = M_PI - M_PI / 6 + (M_PI + M_PI / 3);
        _zmj_scaleProgressView.zmj_minValue = 3000.0f;
        _zmj_scaleProgressView.zmj_maxValue = 6000.0f;
        _zmj_scaleProgressView.zmj_section = 4;
        _zmj_scaleProgressView.zmj_lineNum = 60;
        _zmj_scaleProgressView.zmj_lineWidth = zmj_size(2.5);
        _zmj_scaleProgressView.zmj_lineHeight = zmj_size(15);
        _zmj_scaleProgressView.zmj_linePointHeight = zmj_size(21);
        _zmj_scaleProgressView.zmj_fillColor = [UIColor zmj_dynamicColor:[UIColor lightGrayColor] zmj_darkColor:[UIColor lightGrayColor]];
        _zmj_scaleProgressView.zmj_strokeColor = [UIColor zmj_dynamicColor:[UIColor orangeColor] zmj_darkColor:[UIColor orangeColor]];
        _zmj_scaleProgressView.zmj_textColor = [UIColor zmj_dynamicColor:[UIColor lightGrayColor] zmj_darkColor:[UIColor lightGrayColor]];
    }
    return _zmj_scaleProgressView;
}

- (IBAction)zmj_btnAction:(UIButton *)sender {
    
    NSString *zmj_number = [NSString stringWithFormat:@"%ld", 3000 + arc4random() % 3000];
    
    _zmj_scaleProgressView.zmj_number = zmj_number;
    
    _zmj_titleLabel.text = zmj_number;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
