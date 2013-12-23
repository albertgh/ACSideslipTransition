//
//  ACSideslipSwipeInteractiveTransition.h
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

/**
 *  侧滑手势驱动类
 */

#import <Foundation/Foundation.h>

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


@end
