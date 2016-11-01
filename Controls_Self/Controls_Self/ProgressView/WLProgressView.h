//
//  WLProgressView.h
//  Layer隐式动画制作进度条
//
//  Created by ChalresWl on 16/1/8.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLProgressView : UIView
@property (nonatomic)CGFloat progressPercent;
@property (nonatomic, strong)UIColor *progressBackgroundColor;
@property (nonatomic, strong)UIColor *progressPercentColor;
@property (nonatomic, strong)UIColor *beginProgressPercentColor;
@end
