//
//  PageViewChildVC.h
//  Controls_Self
//
//  Created by charles on 2016/10/27.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ScrollBlock)(NSInteger contentOffsetY);

@interface PageViewChildVC : UIViewController

@property (nonatomic, copy) ScrollBlock scrollBlock;
@end
