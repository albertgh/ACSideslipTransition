//
//  ACSideslipPresentAnimation.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ACSideslipMacros.h"

@interface ACSideslipPresentAnimation ()

// 覆盖于处于下层和上层之间的黑色遮罩
@property (strong, nonatomic) UIView *blackMask;

// 上层 VC 之下的阴影遮罩
@property (strong, nonatomic) UIView *shadowMask;

@end


@implementation ACSideslipPresentAnimation

- (id)init
{
    self = [super init];
    if (self)
    {
        // 初始化遮罩层
        self.blackMask = [[UIView alloc] init];
        self.blackMask.backgroundColor = [UIColor blackColor];
        
        // 初始化阴影层
        self.shadowMask = [[UIView alloc] init];
        self.shadowMask.backgroundColor = [UIColor blackColor];
        
        self.shadowMask.layer.shadowColor = [UIColor blackColor].CGColor;
        self.shadowMask.layer.shadowOpacity = 0.6;
        self.shadowMask.layer.shadowRadius = 8.0f;
        self.shadowMask.layer.shadowOffset = CGSizeMake(-4.f, 0.f);
        self.shadowMask.layer.masksToBounds = NO;
    }
    return self;
}

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
    backVC.view.frame = screenBounds;
    
    // 设定 frontVC 初始坐标
    frontVC.view.frame = CGRectOffset(screenBounds, screenBounds.size.width, 0);
    
    // 黑色遮罩
    self.blackMask.frame = backVC.view.frame;
    self.blackMask.alpha = 0.0f;
    
    // 阴影遮罩
    self.shadowMask.frame = frontVC.view.frame;
    self.shadowMask.alpha = 0.0f;
    self.shadowMask.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.shadowMask.bounds].CGPath;
    
    
    // Add fromVC & toVC 's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:backVC.view];
    
    [containerView addSubview:self.blackMask];
    [containerView addSubview:self.shadowMask];
    
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
                         backVC.view.frame = CGRectOffset(screenBounds, PARALLAX_DX, 0.f); // 变化 dx 来做视差效果
                         frontVC.view.frame = screenBounds;
                         
                         // 遮罩的位置与 下面的 VC 保持一致，并在 Present 完成后 达到最深色
                         self.blackMask.frame = backVC.view.frame;
                         self.blackMask.alpha = BLACK_MASK_ALPHA_MAX;
                         
                         // 阴影遮罩的位置与 上层的 frontVC 保持一致，并在 Present 完成后达到最深阴影
                         self.shadowMask.frame = frontVC.view.frame;
                         self.shadowMask.alpha = SHADOW_MASK_ALPHA_MAX;
                         
                         
                     } completion:^(BOOL finished) {
                         // Tell context that we completed.
                         
                         [transitionContext completeTransition:YES];
                     }];
}


@end
