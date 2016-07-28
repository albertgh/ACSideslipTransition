//
//  UIViewController+ACSideslip.m
//  ACSideslipTransition
//
//  Created by ac_nm on 16/7/28.
//  Copyright © 2016年 Albert Chu. All rights reserved.
//

#import "UIViewController+ACSideslip.h"
#import "objc/runtime.h"


static const char * kACSideslipTransitionObjectKey;


@implementation UIViewController (ACSideslip)

#pragma mark - Public

- (void)ac_sideslip:(UIViewController * __nonnull)newVC from:(UIViewController * __nonnull)oldVC {
    [self ac_sideslip:newVC from:oldVC completion:nil];
}

- (void)ac_sideslip:(UIViewController * __nonnull)newVC from:(UIViewController * __nonnull)oldVC completion:(void (^ __nullable)(void))completion {
    ACSideslipTransition *sideslipTransitionObject = [self ac_sideslipTransitionObject];
    if (!sideslipTransitionObject) {
        sideslipTransitionObject = [[ACSideslipTransition alloc] init];
        [self ac_setSideslipTransitionObject:sideslipTransitionObject];
    }
    [sideslipTransitionObject sideslip:newVC from:self completion:completion];
}

#pragma mark - Associated Properties

- (void)ac_setSideslipTransitionObject:(ACSideslipTransition *)sideslipTransitionObject {
    objc_setAssociatedObject(self,
                             kACSideslipTransitionObjectKey,
                             sideslipTransitionObject,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ACSideslipTransition *)ac_sideslipTransitionObject {
    ACSideslipTransition *sideslipTransitionObject = objc_getAssociatedObject(self, kACSideslipTransitionObjectKey);
    return sideslipTransitionObject;
}

@end
