//
//  ACSideslipSwipeInteractiveTransitionFinishedDelegate.h
//  ACSideslipTransition
//
//  Created by Albert Chu on 14/7/18.
//  Copyright (c) 2014年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ACSideslipSwipeInteractiveTransitionFinishedDelegate <NSObject>

@optional
/** 手势 Dismiss 成功完成 */
- (void)swipeInteractiveTransitionDidFinished;

@end
