//
//  ACSideslipSwipeInteractiveTransition.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ACSideslipSwipeInteractiveTransition.h"

#import "ACSideslipConstants.h"

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
        self.shadowMask.layer.shadowRadius = 8.0;
        self.shadowMask.layer.shadowOffset = CGSizeMake(-4.0, 0.0);
        self.shadowMask.layer.masksToBounds = NO;
    }
    return self;
}

#pragma mark - Public Method

- (void)addGestureToViewController:(UIViewController *)viewController
{
    UIScreenEdgePanGestureRecognizer *gestureRecognizer =
    [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    gestureRecognizer.edges = UIRectEdgeLeft;
    
    self.presentingVC = viewController;
    
    // 如果 present 的是个 UINavigationController , 确保只把手势加给 rootViewController , 避免与其 push 的新视图控制器原生手势冲突
    if ([viewController isMemberOfClass:[UINavigationController class]])
    {
        UINavigationController *navC = (UINavigationController *)viewController;
        
        UIViewController *navRootVC = navC.viewControllers[0];
        
        [navRootVC.view addGestureRecognizer:gestureRecognizer];
        
        self.finishDelegate = (UIViewController<ACSideslipSwipeInteractiveTransitionFinishedDelegate> *)navRootVC;
    }
    else
    {
        [viewController.view addGestureRecognizer:gestureRecognizer];
        
        self.finishDelegate = (UIViewController<ACSideslipSwipeInteractiveTransitionFinishedDelegate> *)viewController;
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
            if (translation.x > 0.0)  /** 防止拖拽超过屏幕左边 */
            {
                // Calculate the percentage of guesture
                CGFloat percentComplete = translation.x / ([[UIScreen mainScreen] applicationFrame].size.width);
                
                // Limit it between 0 and 1
                percentComplete = fminf(fmaxf(percentComplete, 0.0), 1.0);
                
                //NSLog(@"ttttt===%f", translation.x);
                //NSLog(@"%f,percent", percentComplete);
                
                self.shouldComplete = (percentComplete > ACST_SwipeShouldFinishDismissPercent);
                
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
            
            // 取得手指离开屏幕时的移动速度
            CGPoint velocity = [gestureRecognizer velocityInView:gestureRecognizer.view.superview];
            CGFloat xSpeed = velocity.x;
            
            //NSLog(@"最后速度%f", xSpeed);
            //NSLog(@"剩余距离%f", (([[UIScreen mainScreen] applicationFrame].size.width) - translation.x));
            //NSLog(@"动画时间%f", (([[UIScreen mainScreen] applicationFrame].size.width) - translation.x) / xSpeed);
            
            if (xSpeed > 600.0)
            {
                CGFloat leftDistance = ([[UIScreen mainScreen] applicationFrame].size.width) - translation.x;
                NSTimeInterval leftTime = leftDistance / (xSpeed * 1.6); // 1.6 倍数随便设的，，看起来差不多了，因为不只是手指离开时的速度问题，还有加速度的惯性问题，单纯只用离开时速度算，手感就与现实物理世界感觉差距太大了，随便给个大一点速度凑乎了。
                
                [self finishTranslationAnimationWithDuration:leftTime];
            }
            else
            {
                if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled)
                {
                    [self cancelTheTranslation];
                }
                else
                {
                    [self finishTranslation];
                }
                
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
    backVC.view.frame = CGRectOffset(screenBounds, ACST_HorizontalParallax, 0.0);     // 初始位置 dx 有偏移 与 Present 中同步视差
    
    // 设定 frontVC 初始坐标
    frontVC.view.frame = screenBounds;
    
    // 黑色遮罩
    self.blackMask.frame = backVC.view.frame;
    self.blackMask.alpha = ACST_BlackMaskMaxAlpha;
    
    // 阴影遮罩
    self.shadowMask.frame = frontVC.view.frame;
    self.shadowMask.alpha = ACST_ShadowmaskMaxAlpha;
    self.shadowMask.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.shadowMask.bounds].CGPath;
    
    self.blackMask.hidden = NO;
    self.shadowMask.hidden = NO;
    
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
    frontVC.view.frame = CGRectOffset(screenBounds, distance, 0.0);
    
    CGFloat bVCShoudMove = ACST_HorizontalParallax * (1.0 - self.percentComplete);
    backVC.view.frame = CGRectOffset(screenBounds, bVCShoudMove, 0.0);
    
    // 黑色遮罩的位置与 下层的 backVC 保持一致，并在 Dismiss 后消失
    self.blackMask.frame = backVC.view.frame;
    self.blackMask.alpha = ACST_BlackMaskMaxAlpha * (1.0 - self.percentComplete);
    
    // 阴影遮罩的位置与 上层的 frontVC 保持一致，并在 Dismiss 后消失
    self.shadowMask.frame = frontVC.view.frame;
    self.shadowMask.alpha = ACST_ShadowmaskMaxAlpha * (1.0 - self.percentComplete);
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
    [UIView animateWithDuration:(ACST_SwipeCancleDismissDuration * self.percentComplete)
                          delay:0.0
         usingSpringWithDamping:ACST_PresentSpring
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         // 动画完成后将达到的最终坐标
                         backVC.view.frame = CGRectOffset(screenBounds, ACST_HorizontalParallax, 0.0); // 变化 dx 来做视差效果
                         frontVC.view.frame = screenBounds;
                         
                         // 遮罩的位置与 下面的 VC 保持一致，并在 Present 完成后 达到最深色
                         self.blackMask.frame = backVC.view.frame;
                         self.blackMask.alpha = ACST_BlackMaskMaxAlpha;
                         
                         // 阴影遮罩的位置与 上层的 frontVC 保持一致，并在 Present 完成后达到最深阴影
                         self.shadowMask.frame = frontVC.view.frame;
                         self.shadowMask.alpha = ACST_ShadowmaskMaxAlpha;
                         
                         
                     } completion:^(BOOL finished) {
                         // Tell context that we completed.
                         self.blackMask.hidden = YES;
                         self.shadowMask.hidden = YES;
                         [self.context completeTransition:NO];
                     }];
    
    
}

/** 触摸结束后，达到指定百分比，完成剩余动画 */
- (void)finishTranslation
{
    // 按剩余百分比计算完成动画时间
    NSTimeInterval leftTime = (ACST_SwipeFinishDismissDuration * (1.0 - self.percentComplete));
    [self finishTranslationAnimationWithDuration:leftTime];
}

/** 按指定时间完成结束动画 */
- (void)finishTranslationAnimationWithDuration:(NSTimeInterval)duration
{
    [self finishInteractiveTransition];
    
    UIViewController *frontVC = [self.context viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *backVC = [self.context viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get mainScreen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // Do animate
    [UIView animateWithDuration:duration animations:^{
        
        // 动画完成后将达到的最终坐标
        frontVC.view.frame = CGRectOffset(screenBounds, screenBounds.size.width, 0.0);
        backVC.view.frame = screenBounds;
        
        // 黑色遮罩的位置与 下层的 backVC 保持一致，并在 Dismiss 后消失
        self.blackMask.frame = backVC.view.frame;
        self.blackMask.alpha = 0.0;
        
        // 阴影遮罩的位置与 上层的 frontVC 保持一致，并在 Dismiss 后消失
        self.shadowMask.frame = frontVC.view.frame;
        self.shadowMask.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.blackMask.hidden = YES;
        self.shadowMask.hidden = YES;
        [self.context completeTransition:YES];
    }];
    
    if (self.finishDelegate && [self.finishDelegate respondsToSelector:@selector(swipeInteractiveTransitionDidFinished)])
    {
        [self.finishDelegate swipeInteractiveTransitionDidFinished];
    }
}

@end
