//
//  ACSideslipSwipeInteractiveTransition.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ACSideslipMacros.h"

@interface ACSideslipSwipeInteractiveTransition ()

@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, strong) UIViewController *presentingVC;

/** 取得上下文引用 */
@property (nonatomic, strong) id<UIViewControllerContextTransitioning> context;

/** 覆盖于 下层 VC 的黑色遮罩 */
@property (strong, nonatomic) UIView *blackMask;

/** 上层 VC 之下的阴影遮罩 */
@property (strong, nonatomic) UIView *shadowMask;

@end


@implementation ACSideslipSwipeInteractiveTransition

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

#pragma mark - Public Method

- (void)addGestureToViewController:(UIViewController *)viewController
{
    UIScreenEdgePanGestureRecognizer *gestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    gestureRecognizer.edges = UIRectEdgeLeft;
    
    self.presentingVC = viewController;
    
    // 如果 present 的是个 UINavigationController , 确保只把手势加给 rootViewController , 避免与其 push 的新视图控制器原生手势冲突
    if ([viewController isMemberOfClass:[UINavigationController class]])
    {
        UINavigationController *navC = (UINavigationController *)viewController;
        
        UIViewController *navRootVC = [navC.viewControllers objectAtIndex:0];
        
        [navRootVC.view addGestureRecognizer:gestureRecognizer];
    }
    else
    {
        [viewController.view addGestureRecognizer:gestureRecognizer];
    }
}

/** 处理手势响应 */
- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    // 取得触摸点
    CGPoint location = [gestureRecognizer locationInView:gestureRecognizer.view.superview];
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            if (location.x < CGRectGetMidX(gestureRecognizer.view.bounds))
            {
                self.interacting = YES;
                [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            }
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            if (translation.x > 0)  /** 防止拖拽越界 */
            {
                // Calculate the percentage of guesture
                CGFloat percentComplete = (translation.x + 0.f) / ([[UIScreen mainScreen] applicationFrame].size.width - 0.f);
                
                // Limit it between 0 and 1
                percentComplete = fminf(fmaxf(percentComplete, 0.0), 1.0);
                
                //NSLog(@"ttttt===%f", translation.x);
                //NSLog(@"%f,percent", percentComplete);
                
                self.shouldComplete = (percentComplete > SWIPE_PERCENT);
                
                [self updateInteractiveTransition:percentComplete];
                
                [self updateTranslationWith:translation.x];
            }
            
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            self.interacting = NO;
            
            // Gesture over. Check if the transition should finish or not
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled)
            {
                [self cancelTheTranslation];
            }
            else
            {
                [self finishTheTranslation];
            }
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - UIViewControllerInteractiveTransitioning Methods

-(void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // Maintain reference to context
    self.context = transitionContext;
    
    UIViewController *frontVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *backVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get mainScreen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // 设定 backVC 初始坐标
    backVC.view.frame = CGRectOffset(screenBounds, PARALLAX_DX, 0.f);     // 初始位置 dx 有偏移 与 Present 中同步视差
    
    // 设定 frontVC 初始坐标
    frontVC.view.frame = screenBounds;
    
    // 黑色遮罩
    self.blackMask.frame = backVC.view.frame;
    self.blackMask.alpha = BLACK_MASK_ALPHA_MAX;
    
    // 阴影遮罩
    self.shadowMask.frame = frontVC.view.frame;
    self.shadowMask.alpha = SHADOW_MASK_ALPHA_MAX;
    self.shadowMask.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.shadowMask.bounds].CGPath;
    
    // Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:backVC.view];
    
    [containerView addSubview:self.blackMask];
    [containerView addSubview:self.shadowMask];
    
    [containerView addSubview:frontVC.view];
    [containerView sendSubviewToBack:backVC.view];
}

#pragma mark - 根据移动距离处理交互

/** 有距离移动变化时的响应 */
- (void)updateTranslationWith:(CGFloat)distance
{
    UIViewController *frontVC = [self.context viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *backVC = [self.context viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get mainScreen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // 动画完成后将达到的最终坐标
    frontVC.view.frame = CGRectOffset(screenBounds, distance, 0);
    
    CGFloat bVCShoudMove = PARALLAX_DX * (1 - self.percentComplete);
    backVC.view.frame = CGRectOffset(screenBounds, bVCShoudMove, 0);
    
    // 黑色遮罩的位置与 下层的 backVC 保持一致，并在 Dismiss 后消失
    self.blackMask.frame = backVC.view.frame;
    self.blackMask.alpha = BLACK_MASK_ALPHA_MAX * (1 - self.percentComplete);
    
    // 阴影遮罩的位置与 上层的 frontVC 保持一致，并在 Dismiss 后消失
    self.shadowMask.frame = frontVC.view.frame;
    self.shadowMask.alpha = SHADOW_MASK_ALPHA_MAX * (1 - self.percentComplete);
}

/** 触摸结束后，未达到指定百分比，返回原状态 */
- (void)cancelTheTranslation
{
    [self cancelInteractiveTransition];
    
    UIViewController *frontVC = [self.context viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *backVC = [self.context viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get mainScreen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    

    // Do animate
    [UIView animateWithDuration:(CANCEL_DURATION * self.percentComplete)
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
                         
                         [self.context completeTransition:NO];
                     }];
    
    
}

/** 触摸结束后，达到指定百分比，完成剩余动画 */
- (void)finishTheTranslation
{
    [self finishInteractiveTransition];
    
    UIViewController *frontVC = [self.context viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *backVC = [self.context viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get mainScreen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // Do animate
    [UIView animateWithDuration:(FINISH_DURATION * (1 - self.percentComplete)) animations:^{
        
        // 动画完成后将达到的最终坐标
        frontVC.view.frame = CGRectOffset(screenBounds, screenBounds.size.width, 0);
        backVC.view.frame = screenBounds;
        
        // 黑色遮罩的位置与 下层的 backVC 保持一致，并在 Dismiss 后消失
        self.blackMask.frame = backVC.view.frame;
        self.blackMask.alpha = 0.0f;
        
        // 阴影遮罩的位置与 上层的 frontVC 保持一致，并在 Dismiss 后消失
        self.shadowMask.frame = frontVC.view.frame;
        self.shadowMask.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        [self.context completeTransition:YES];
    }];

}

@end
