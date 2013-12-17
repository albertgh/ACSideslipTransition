//
//  ACModalViewControllerDelegate.h
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ACModalViewControllerDelegate <NSObject>

- (void)modalViewControllerDoDismiss:(UIViewController *)viewController;

@end
