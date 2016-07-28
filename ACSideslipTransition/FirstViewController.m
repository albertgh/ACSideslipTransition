//
//  FirstViewController.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-12.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

#import "UIViewController+ACSideslip.h"


@interface FirstViewController ()

@end


@implementation FirstViewController


#pragma mark Action method

- (void)buttonClicked:(id)sender
{
    SecondViewController *sVC =  [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nC = [[UINavigationController alloc] initWithRootViewController:sVC];
    
    [self ac_sideslip:nC from:self completion:^{
        NSLog(@"sideslip complete");
    }];
}


#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
        
    //-- test button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 200.0, 120.0, 40.0);
    button.backgroundColor = [UIColor orangeColor];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    //--------------------------------------------------------------------------------------------//
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


@end
