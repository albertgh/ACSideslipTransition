//
//  SecondViewController.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "SecondViewController.h"
#import "ThridViewController.h"

#import "ACSideslipSwipeInteractiveTransitionFinishedDelegate.h"

@interface SecondViewController () <ACSideslipSwipeInteractiveTransitionFinishedDelegate>

@end


@implementation SecondViewController

#pragma mark - ACSideslipSwipeInteractiveTransitionFinishedDelegate

- (void)swipeInteractiveTransitionDidFinished
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma mark - Action Methods

- (void)leftBarButtonItemPressed:(id)sender
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)buttonClicked:(id)sender
{
    ThridViewController *tVC = [[ThridViewController alloc] init];
    [self.navigationController pushViewController:tVC animated:YES];
}

#pragma mark - Life Cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.title = @"Second VC";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //-- 状态栏文字颜色 ------------------------------------------------------------------------------
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //---------------------------------------------------------------------------------------------;
    
    //-- 导航栏三色 ------------------------------------------------------------------------------
    [self ac_setNavigationBarColorsWithTitleColor:[UIColor whiteColor]
                                         barColor:[UIColor colorWithRed:100 / 255.f
                                                                  green:180 / 255.f
                                                                   blue:250 / 255.f
                                                                  alpha:1.f]
                                      actionColor:[UIColor whiteColor]];
    //---------------------------------------------------------------------------------------------;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
