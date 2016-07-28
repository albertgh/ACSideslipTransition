//
//  UIViewController+ACSideslip.h
//  ACSideslipTransition
//
//  Created by ac_nm on 16/7/28.
//  Copyright © 2016年 Albert Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ACSideslipTransition.h"


@interface UIViewController (ACSideslip)


- (void)ac_sideslip:(UIViewController * __nonnull)newVC;

- (void)ac_sideslip:(UIViewController * __nonnull)newVC completion:(void (^ __nullable)(void))completion;

@end
