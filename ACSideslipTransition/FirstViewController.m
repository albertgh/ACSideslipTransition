//
//  FirstViewController.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-12.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ACSideslipTransition.h"


@interface FirstViewController ()

@property (strong, nonatomic) ACSideslipTransition *sideslipTransition;

@end


@implementation FirstViewController


#pragma mark Action method

- (void)buttonClicked:(id)sender
{
    SecondViewController *sVC =  [[SecondViewController alloc] init];
    
    UINavigationController *nC = [[UINavigationController alloc] initWithRootViewController:sVC];
    
    [self.sideslipTransition sideslip:nC from:self];
}


#pragma mark - LifeCycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.sideslipTransition = [ACSideslipTransition new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
        
    //-- 按钮 ---------------------------------------------------------------------------------------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 200.0, 120.0, 40.0);
    button.backgroundColor = [UIColor orangeColor];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"Next" forState:UIControlStateNormal];
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
