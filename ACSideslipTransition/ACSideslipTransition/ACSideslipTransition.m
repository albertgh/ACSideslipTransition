//
//  ACSideslipTransition.m
//  ACSideslipTransition
//
//  Created by Albert Chu on 13-12-18.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ACSideslipTransition.h"

#import "ACSideslipPresentAnimation.h"
#import "ACSideslipDismissAnimation.h"
#import "ACSideslipSwipeInteractiveTransition.h"

@interface ACSideslipTransition () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) ACSideslipPresentAnimation *presentAnimation;
@property (strong, nonatomic) ACSideslipDismissAnimation *dismissAnimation;
@property (strong, nonatomic) ACSideslipSwipeInteractiveTransition *interactiveTransition;

@end


@implementation ACSideslipTransition

- (id)init
{
    self = [super init];
    if (self)
    {
        self.presentAnimation = [[ACSideslipPresentAnimation alloc] init];
        self.dismissAnimation = [[ACSideslipDismissAnimation alloc] init];
        self.interactiveTransition = [[ACSideslipSwipeInteractiveTransition alloc] init];
    }
    return self;
}

#pragma mark - Public Method

- (void)sideslip:(UIViewController *)newVC from:(UIViewController *)oldVC
{
    newVC.transitioningDelegate = self;
    
    [self.interactiveTransition addGestureToViewController:newVC];
    
    [oldVC presentViewController:newVC animated:YES completion:nil];
}

#pragma mark - Transition Delegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    // Return nil if we are not interactive
    return self.interactiveTransition.interacting ? self.interactiveTransition : nil;
}

@end
