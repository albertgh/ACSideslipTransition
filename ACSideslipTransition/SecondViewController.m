//
//  SecondViewController.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end



@implementation SecondViewController


-(void) buttonClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDoDismiss:)])
    {
        [self.delegate modalViewControllerDoDismiss:self];
    }
}

- (id)init
{
    self = [super init];
    if (self)
    {
        //-- 状态栏文字颜色 --------------------------------------------------------------------------
        self.lightStatusBarColor = YES;
        //-----------------------------------------------------------------------------------------;
        
        
        //-- 导航栏各种着色 --------------------------------------------------------------------------
        
        // 导航栏背景色
        self.navigationBarBarTintColor = [UIColor colorWithRed:100  / 255.f green:180 / 255.f blue:250 / 255.f alpha:1.f];
        
        // 导航栏 Title 文字 颜色
        self.navigationBarTitleTextTintColor = [UIColor whiteColor];
        //-----------------------------------------------------------------------------------------;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"Second VC";
    
    
    //-- 按钮 ---------------------------------------------------------------
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 200.0, 120.0, 40.0);
    
    button.backgroundColor = [UIColor purpleColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitle:@"Go Back" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
