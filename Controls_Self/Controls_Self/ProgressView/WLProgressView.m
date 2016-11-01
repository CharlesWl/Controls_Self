//
//  WLProgressView.m
//  Layer隐式动画制作进度条
//
//  Created by ChalresWl on 16/1/8.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "WLProgressView.h"
@interface WLProgressView ()
@property (nonatomic ,strong)CAGradientLayer *progressLayer;
@property (nonatomic)CGFloat progressWidth;
@end


@implementation WLProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        [self initialize];
//    }
//    return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}

- (void)initialize {
    [self layoutIfNeeded];
    //进度条设置
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = self.frame.size.height/2;
    //进度条layer设置
    self.progressLayer = [CAGradientLayer layer];
    self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    //渐变
    self.progressLayer.colors = @[(__bridge id)[UIColor colorWithRed:255.0/255 green:193.0/255 blue:218.0/255 alpha:1].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    self.progressLayer.cornerRadius = self.frame.size.height/2;
    self.progressLayer.startPoint = CGPointMake(0, 0.5);
    self.progressLayer.endPoint = CGPointMake(1, 0.5);
    [self.layer addSublayer:self.progressLayer];
}

- (void)setProgressPercent:(CGFloat)progressPercent {
    _progressPercent = progressPercent;
    if (progressPercent < 0) {
        self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    } else if (progressPercent > 1) {
        self.progressLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } else {
        self.progressLayer.frame = CGRectMake(0, 0, _progressPercent * self.frame.size.width, self.frame.size.height);
    }
    
}

- (void)setProgressBackgroundColor:(UIColor *)progressBackgroundColor {
    _progressBackgroundColor = progressBackgroundColor;
    self.backgroundColor = progressBackgroundColor;
    
}

- (void)setProgressPercentColor:(UIColor *)progressPercentColor {
    _progressPercentColor = progressPercentColor;
    //self.progressLayer.colors = @[(__bridge id)_beginProgressPercentColor.CGColor, (__bridge id)progressPercentColor.CGColor];
}

- (void)setBeginProgressPercentColor:(UIColor *)beginProgressPercentColor {
    _beginProgressPercentColor = beginProgressPercentColor;
//    self.progressLayer.colors = @[(__bridge id)beginProgressPercentColor.CGColor, (__bridge id)_progressBackgroundColor.CGColor];
}

@end
