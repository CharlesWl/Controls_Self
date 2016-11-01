//
//  WLCountDownButton.m
//  Controls_Self
//
//  Created by charles on 2016/10/26.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "WLCountDownButton.h"

@interface WLCountDownButton ()
@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, assign) NSInteger changeTime;
@end

@implementation WLCountDownButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self settingSelfStyle];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self settingSelfStyle];
}

- (void)settingSelfStyle {
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self addTarget:self action:@selector(didClickOnGetSercert) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickOnGetSercert {
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
    [self.myTimer fire];
    self.enabled = NO;
    self.didClickOnGet();
}

- (void)scrollTimer {
    self.changeTime --;
    [self setTitle:[NSString stringWithFormat:@"%lds",self.changeTime] forState:UIControlStateNormal];
    if (self.changeTime == 0) {
        [self.myTimer invalidate];
        self.changeTime = self.seconds;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.enabled = YES;
    }
}

- (void)setSeconds:(NSInteger)seconds {
    _seconds = seconds;
    self.changeTime = seconds;
}

- (void)dealloc {
    [self.myTimer invalidate];
    self.myTimer = nil;
}

@end
