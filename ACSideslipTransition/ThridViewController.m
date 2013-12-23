//
//  ThridViewController.m
//  ACSideslipTransition
//
//  Created by Albert Chu on 13-12-18.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ThridViewController.h"

@interface ThridViewController ()

@end


@implementation ThridViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // 导航栏背景色，不设定则会继承前一个颜色
    self.navigationBarBarTintColor = [UIColor colorWithRed:116  / 255.f green:220 / 255.f blue:80 / 255.f alpha:1.f];
    
    
    self.title = @"Thrid VC";
        
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
