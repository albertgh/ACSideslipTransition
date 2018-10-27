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

- (void)dealloc
{
    NSLog(@"dealloc SecondViewController");
}

#pragma mark - ACSideslipSwipeInteractiveTransitionFinishedDelegate

- (void)swipeInteractiveTransitionDidFinished
{
    NSLog(@"dismissed by gesture");
}

#pragma mark - Action Methods

- (void)leftBarButtonItemPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismissed by program");
    }];
}

- (void)buttonClicked:(id)sender
{
    ThridViewController *tVC = [[ThridViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:tVC animated:YES];
}

#pragma mark - Init

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

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    
    [self ac_setNavigationBarColorsWithTitleColor:[UIColor whiteColor]
                                         barColor:[UIColor colorWithRed:100 / 255.f
                                                                  green:180 / 255.f
                                                                   blue:250 / 255.f
                                                                  alpha:1.f]
                                      actionColor:[UIColor whiteColor]];
    
    
    
    //-- leftItem
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
    //--------------------------------------------------------------------------------------------//
    
    
    
    //-- push button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 200.0, 120.0, 40.0);
    
    button.backgroundColor = [UIColor purpleColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitle:@"原生 Push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //--------------------------------------------------------------------------------------------//
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
