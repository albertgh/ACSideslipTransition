//
//  ACSideslipTransition.h
//  ACSideslipTransition
//
//  Created by Albert Chu on 13-12-18.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACSideslipTransition : NSObject

- (void)sideslip:(UIViewController *)newVC from:(UIViewController *)oldVC;

- (void)sideslip:(UIViewController *)newVC from:(UIViewController *)oldVC completion:(void (^ __nullable)(void))completion;

@end
