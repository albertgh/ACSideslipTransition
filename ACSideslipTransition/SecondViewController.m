//
//  SecondViewController.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "SecondViewController.h"
#import "ThridViewController.h"

@interface SecondViewController ()

@end



@implementation SecondViewController


- (void)leftBarButtonItemPressed:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDoDismiss:)])
    {
        [self.delegate modalViewControllerDoDismiss:self];
    }
}

- (void)buttonClicked:(id)sender
{
    ThridViewController *tVC = [[ThridViewController alloc] init];
    [self.navigationController pushViewController:tVC animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //-- 状态栏文字颜色 ------------------------------------------------------------------------------
    self.lightStatusBarColor = YES;
    //---------------------------------------------------------------------------------------------;
    
    
    //-- 导航栏各种着色 ------------------------------------------------------------------------------
    
    // 导航栏背景色
    self.navigationBarBarTintColor = [UIColor colorWithRed:100  / 255.f green:180 / 255.f blue:250 / 255.f alpha:1.f];
    
    // 导航栏 Title 文字 颜色
    self.navigationBarTitleTextTintColor = [UIColor whiteColor];
    
    // 互动按钮 文字 颜色
    self.navigationBarActionItemTintColor = [UIColor whiteColor];
    //---------------------------------------------------------------------------------------------;
    
    self.title = @"Second VC";
    
    
    //-- leftItem ----------------------------------------------------------------------------------
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 22, 22);
    [backButton addTarget:self action:@selector(leftBarButtonItemPressed:) forControlEvents:UIControlEventTouchUpInside];
    //backButton.showsTouchWhenHighlighted = YES;
    
    UIImage *backButtonImage = [UIImage imageNamed:@"nav_back.png"];
    [backButton setImage:backButtonImage forState:UIControlStateNormal];
    
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
    
    //backButton.backgroundColor = [UIColor yellowColor];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backBarButtonItem;

    //---------------------------------------------------------------------------------------------;
    
    
    //-- 按钮 ---------------------------------------------------------------------------------------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 200.0, 120.0, 40.0);
    
    button.backgroundColor = [UIColor purpleColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitle:@"原生 Push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //---------------------------------------------------------------------------------------------;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
