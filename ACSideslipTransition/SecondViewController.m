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
    
    
    //-- 状态栏文字颜色 --------------------------------------------------------------------------
    self.lightStatusBarColor = YES;
    //-----------------------------------------------------------------------------------------;
    
    
    //-- 导航栏各种着色 --------------------------------------------------------------------------
    
    // 导航栏背景色
    self.navigationBarBarTintColor = [UIColor colorWithRed:100  / 255.f green:180 / 255.f blue:250 / 255.f alpha:1.f];
    
    // 导航栏 Title 文字 颜色
    self.navigationBarTitleTextTintColor = [UIColor whiteColor];
    
    // 互动按钮 文字 颜色
    self.navigationBarActionItemTintColor = [UIColor whiteColor];
    //-----------------------------------------------------------------------------------------;
    
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

    //-----------------------------------------------------------------
    
    
    //-- 按钮 ---------------------------------------------------------------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 100.0, 120.0, 40.0);
    
    button.backgroundColor = [UIColor purpleColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitle:@"原生 Push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //-- 测试手势冲突 ----------------------------------------------------------------------------------
    UITextView *testTextView = [[UITextView alloc] initWithFrame:CGRectMake(0.f,
                                                                            200.f,
                                                                            600.f,
                                                                            320.f)];
    
    
    testTextView.text = @"要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突信仰是秋裤。在萧瑟的的秋冬给你最贴心的温暖，在宜人的春夏很难被想起。当一群都穿着秋裤的兄弟姐妹们聚在一起，会大谈秋裤的质地、面料、款式......其乐无穷。当遇到不穿秋裤的人，穿着秋裤的人就像穿着破烂马褂的孔乙己，小心翼翼的不被看到裤脚露出的秋裤。美丽的姑娘不喜欢穿秋裤，她们认为秋裤显腿粗，其实根本没人在乎你的腿是否粗了0.001厘米，但她们坚持不穿秋裤。保守的人认为，只要天气一冷一定要穿上秋裤，否则一定会月经不调腰膝酸软. 穿，还是不穿，秋裤就在那里，不冷不热。";
    
    [testTextView setTextColor:[UIColor blackColor]];
    
    testTextView.backgroundColor = [UIColor lightGrayColor];
    
    //self.automaticallyAdjustsScrollViewInsets = NO ;
    
    [self.view addSubview:testTextView];
    //--------------------------------------------------------------------------------------------//
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
