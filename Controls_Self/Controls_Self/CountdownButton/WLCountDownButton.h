//
//  WLCountDownButton.h
//  Controls_Self
//
//  Created by charles on 2016/10/26.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidClickOnGet)();

@interface WLCountDownButton : UIButton
@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, copy) DidClickOnGet didClickOnGet;
@end
