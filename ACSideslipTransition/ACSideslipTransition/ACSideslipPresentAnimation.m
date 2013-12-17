//
//  ACSideslipPresentAnimation.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ACSideslipMacros.h"

@implementation ACSideslipPresentAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return PRESENT_DURATION;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // Get controllers from transition context
    UIViewController *backVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *frontVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get mainScreen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // 设定 backVC 初始坐标
    CGRect backVCfinalFrame = [transitionContext finalFrameForViewController:backVC];
    backVC.view.frame = backVCfinalFrame;
    
    // 设定 frontVC 初始坐标
    CGRect frontVCfinalFrame = [transitionContext finalFrameForViewController:frontVC];
    frontVC.view.frame = CGRectOffset(frontVCfinalFrame, screenBounds.size.width, 0);
    
    
    //** 阴影和遮罩 *********************************************************************************
    
    //-- 阴影 --------------------------------------------------------------------------------------
//    frontVC.view.layer.shadowColor = [[UIColor blackColor] CGColor];
//    frontVC.view.layer.shadowOffset = CGSizeMake(10.0f,10.0f);
//    frontVC.view.layer.shadowOpacity = 1.f;
//    frontVC.view.layer.shadowRadius = 10.0f;
    
    // 为什么加了阴影会卡翔，而且动画内也没反应。。
    
    //----------------------------------------------------------------------------------------------
    
    //-- 遮罩 ---------------------------------------------------------------------------------------
//    UIView *blackMask = [[UIView alloc]init];
//    blackMask.backgroundColor = [UIColor blackColor];
//    blackMask.frame = backVCfinalFrame;
//    [backVC.view addSubview:blackMask];
//
    
    // 应该要写个带 遮罩属性的 containerView
    
    //----------------------------------------------------------------------------------------------
    
    //**********************************************************************************************
    
    
    // Add fromVC & toVC 's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:backVC.view];
    [containerView addSubview:frontVC.view];
    [containerView sendSubviewToBack:backVC.view];
    
    // Do animate
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:PRESENT_SPRING
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         // 动画完成后将达到的最终坐标
                         backVC.view.frame = CGRectOffset(backVCfinalFrame, PARALLAX_DX, 0.f); // 变化 dx 来做视差效果
                         frontVC.view.frame = frontVCfinalFrame;
                         
                         //frontVC.view.layer.shadowOpacity = 0.3f;
                         
                         
                     } completion:^(BOOL finished) {
                         // Tell context that we completed.
                         
                         [transitionContext completeTransition:YES];
                     }];
}


@end
