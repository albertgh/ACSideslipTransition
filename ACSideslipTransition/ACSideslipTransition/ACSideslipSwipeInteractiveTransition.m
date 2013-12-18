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

/** 是否从最左边触发 （其实也不是最左，因为指肚中点不在最左，系统 push 出的视图控制器，大概是在 20 位置响应） */
@property (nonatomic, assign) BOOL isFromLeftmost;

@end


@implementation ACSideslipSwipeInteractiveTransition

-(void)wireToViewController:(UIViewController *)viewController
{
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView*)view
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

-(CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    // 取得触摸点
    CGPoint location = [gestureRecognizer locationInView:gestureRecognizer.view.superview];
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    
    
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            if (location.x < 26)
            {
                self.isFromLeftmost = YES;
                // Mark the interacting flag. Used when supplying it in delegate.
                self.interacting = YES;
                [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            }
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            if (self.isFromLeftmost)
            {
                // Calculate the percentage of guesture
                CGFloat fraction = translation.x / [[UIScreen mainScreen] applicationFrame].size.width;
                //Limit it between 0 and 1
                fraction = fminf(fmaxf(fraction, 0.0), 1.0);
                self.shouldComplete = (fraction > SWIPE_PERCENT);
                
                [self updateInteractiveTransition:fraction];
            }
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        {
            self.isFromLeftmost = NO;
            self.interacting = NO;
        }
            
        case UIGestureRecognizerStateCancelled:
        {
            self.isFromLeftmost = NO;
            
            // Gesture over. Check if the transition should happen or not
            self.interacting = NO;
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled)
            {
                [self cancelInteractiveTransition];
            }
            else
            {
                [self finishInteractiveTransition];
            }
            break;
        }
            
        default:
            break;
    }
}


@end
