//
//  PageViewVC.m
//  Controls_Self
//
//  Created by charles on 2016/10/27.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "PageViewVC.h"
#import "PageViewChildVC.h"
#define WindowsW [UIScreen mainScreen].bounds.size.width
#define WindowsH [UIScreen mainScreen].bounds.size.height
@interface PageViewVC ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (strong, nonatomic) IBOutlet UIView *headView;
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSArray *allVCs;
@property (nonatomic, strong) PageViewChildVC *pvcVC;
@property (nonatomic, strong) PageViewChildVC *pvcVC1;
@property (nonatomic, strong) PageViewChildVC *pvcVC2;
@end

@implementation PageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPageViewControllerStyle];
    [self.view addSubview:self.headView];
}

- (void)setPageViewControllerStyle {
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey : @(UIPageViewControllerSpineLocationNone)};
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pageVC.delegate = self;
    self.pageVC.dataSource = self;
    [self.pageVC setViewControllers:@[self.allVCs[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pageVC.view.frame = self.view.bounds;
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
}

#pragma mark - PageViewControllerDataSource -

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.allVCs indexOfObject:viewController];
    if (index == 0) {
        //循环滑动
        //index = [self.pageVCs count] - 1;
        //不循环
        return nil;
    } else {
        index --;
    }
    return [self.allVCs objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.allVCs indexOfObject:viewController];
    index++;
    if (index == [self.allVCs count]) {
        //循环滑动
        //index = 0;
        //不循环
        return nil;
    }
    return [self.allVCs objectAtIndex:index];
}

#pragma mark - PageViewControllerDelegate -

//- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
//    NSUInteger index = [self.allVCs indexOfObject:pendingViewControllers[0]];
//    PageViewChildVC *vc = [self.allVCs objectAtIndex:index];
//    vc.pageViewTV.tableHeaderView = self.headView;
//    NSLog(@"index:%@",pendingViewControllers);
//}

//- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
//    NSUInteger index = [self.allVCs indexOfObject:previousViewControllers[0]];
//    PageViewChildVC *vc = [self.allVCs objectAtIndex:index];
//    vc.contentOffsetY = self.contentOffsetY;
//}

- (NSArray *)allVCs {
    __weak __typeof(self) weakSelf = self;
    
    self.pvcVC = [[PageViewChildVC alloc]init];
    self.pvcVC.scrollBlock = ^(NSInteger contentOffsetY) {
        [weakSelf animationWithContentOffsetY:contentOffsetY];
    };
    
    self.pvcVC1 = [[PageViewChildVC alloc]init];
    self.pvcVC1.scrollBlock = ^(NSInteger contentOffsetY) {
        [weakSelf animationWithContentOffsetY:contentOffsetY];
    };
    self.pvcVC1.view.backgroundColor = [UIColor purpleColor];
    
    self.pvcVC2 = [[PageViewChildVC alloc]init];
    self.pvcVC2.scrollBlock = ^(NSInteger contentOffsetY) {
        [weakSelf animationWithContentOffsetY:contentOffsetY];
    };
    self.pvcVC2.view.backgroundColor = [UIColor brownColor];
    
    if (!_allVCs) {
        _allVCs = @[self.pvcVC,self.pvcVC1,self.pvcVC2];
    }
    return _allVCs;
}

- (void)animationWithContentOffsetY:(NSInteger )contentOffsetY {
    [UIView animateWithDuration:0 animations:^{
        if (contentOffsetY > 180) {
            self.headView.frame = CGRectMake(0, - 180, WindowsW, 200);
        } else if (contentOffsetY < 0) {
            self.headView.frame = CGRectMake(0, 0, WindowsW, 200);
        } else {
            self.headView.frame = CGRectMake(0, - contentOffsetY, WindowsW, 200);
        }
        
    } completion:^(BOOL finished) {

    }];
}

@end
