//
//  FirstViewController.m
//  TransitionDemo
//
//  Created by Albert Chu on 13-12-12.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ACModalViewControllerDelegate.h"
#import "ACSideslipMacros.h"


@interface FirstViewController ()
<
ACModalViewControllerDelegate
,UIViewControllerTransitioningDelegate
>

@property (strong, nonatomic) ACSideslipPresentAnimation *presentAnimation;
@property (strong, nonatomic) ACSideslipDismissAnimation *dismissAnimation;
@property (strong, nonatomic) ACSideslipSwipeInteractiveTransition *interactiveTransition;

@end


@implementation FirstViewController


#pragma mark Action method

-(void) buttonClicked:(id)sender
{
    SecondViewController *sVC =  [[SecondViewController alloc] init];
    
    sVC.delegate = self;
    
    UINavigationController *nC = [[UINavigationController alloc] initWithRootViewController:sVC];
    
    nC.transitioningDelegate = self;
    [self.interactiveTransition wireToViewController:nC];
    
    [self presentViewController:nC animated:YES completion:nil];
}


#pragma mark - LifeCycle

- (id)init
{
    self = [super init];
    if (self)
    {
        self.presentAnimation = [[ACSideslipPresentAnimation alloc] init];
        self.dismissAnimation = [[ACSideslipDismissAnimation alloc] init];
        self.interactiveTransition = [[ACSideslipSwipeInteractiveTransition alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    // 测试 毛玻璃状态栏
    UIToolbar *toolBar = [UIToolbar new];
    toolBar.frame = CGRectMake(0.0f,0.0f,320.0f,20.0f);

    //toolBar.barTintColor = [UIColor orangeColor];

    // 分割线
    CALayer *lineLayer = [[CALayer alloc] init];
    lineLayer.frame = CGRectMake(0.0f,19.5f,320.0f,0.5f);
    lineLayer.backgroundColor = [UIColor colorWithRed:200/255.f green:200/255.f blue:200/255.f alpha:1.f].CGColor;
    [toolBar.layer addSublayer:lineLayer];

    [self.view addSubview:toolBar];
    
    
    
    //-- 按钮 ---------------------------------------------------------------
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 200.0, 120.0, 40.0);
    button.backgroundColor = [UIColor orangeColor];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)modalViewControllerDoDismiss:(UIViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveTransition.interacting ? self.interactiveTransition : nil;
}


@end
