//
//  ACSideslipTransition.h
//  ACSideslipTransition
//
//  Created by Albert Chu on 13-12-18.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACSideslipTransition : NSObject

- (void)sideslip:(UIViewController * __nonnull)newVC from:(UIViewController * __nonnull)oldVC;

- (void)sideslip:(UIViewController * __nonnull)newVC from:(UIViewController * __nonnull)oldVC completion:(void (^ __nullable)(void))completion;

@end
