//
//  ACSideslipDismissAnimation.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ACSideslipMacros.h"

@implementation ACSideslipDismissAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return DISMISS_DURATION;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 靠，from 啊 to 容易搞混的，系统是正序思路，Dismiss 两个 Key 与 Present 是相反的。我还是习惯固定唱名。。。
    UIViewController *frontVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *backVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get mainScreen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // 设定 backVC 初始坐标
    CGRect backVCfinalFrame = [transitionContext initialFrameForViewController:backVC];
    backVC.view.frame = CGRectOffset(backVCfinalFrame, PARALLAX_DX, 0.f);     // 初始位置 dx 有偏移 与 Present 中同步视差
    
    // 设定 frontVC 初始坐标
    CGRect frontVCfinalFrame = [transitionContext initialFrameForViewController:frontVC];
    frontVC.view.frame = frontVCfinalFrame;
    
    // Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:backVC.view];
    [containerView addSubview:frontVC.view];
    [containerView sendSubviewToBack:backVC.view];
    
    // Do animate
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        frontVC.view.frame = CGRectOffset(frontVCfinalFrame, screenBounds.size.width, 0);
        backVC.view.frame = backVCfinalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


@end
