//
//  ACSideslipTransition.h
//  ACSideslipTransition
//
//  Created by Albert Chu on 13-12-18.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACSideslipTransition : NSObject

/**
 *  从当前视图控制器，侧滑出新的视图控制器
 *
 *  @param toVC   新的视图控制器
 *  @param fromVC 当前视图控制器
 */
- (void)sideslip:(UIViewController *)newVC from:(UIViewController *)oldVC;

@end
