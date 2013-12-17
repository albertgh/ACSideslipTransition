//
//  SecondViewController.h
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACModalViewControllerDelegate.h"
#import "ACBaseViewController.h"

@interface SecondViewController : ACBaseViewController

@property (nonatomic, weak) id<ACModalViewControllerDelegate> delegate;

@end
