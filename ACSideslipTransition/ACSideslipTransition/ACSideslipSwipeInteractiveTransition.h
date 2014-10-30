//
//  ACSideslipSwipeInteractiveTransition.h
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ACSideslipSwipeInteractiveTransitionFinishedDelegate.h"

@interface ACSideslipSwipeInteractiveTransition : UIPercentDrivenInteractiveTransition

/**
 *  是否处于交互过程中
 */
@property (nonatomic, assign) BOOL interacting;


/**
 *  添加自定义手势识别
 *
 *  @param viewController 需要添加自定义手势识别的视图控制器
 */
- (void)addGestureToViewController:(UIViewController *)viewController;


/** 手势成功完成 Dismiss 回调代理对象 */
@property (nonatomic, assign) UIViewController <ACSideslipSwipeInteractiveTransitionFinishedDelegate> *finishDelegate;


@end
