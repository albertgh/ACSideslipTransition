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
    

    //-- 测试手势冲突 ----------------------------------------------------------------------------------
    UITextView *testTextView = [[UITextView alloc] initWithFrame:CGRectMake(0.f,
                                                                            200.f,
                                                                            600.f,
                                                                            320.f)];
    
    
    testTextView.text = @"要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突要过滤手势冲突。。。。。。。信仰是秋裤。在萧瑟的的秋冬给你最贴心的温暖，在宜人的春夏很难被想起。当一群都穿着秋裤的兄弟姐妹们聚在一起，会大谈秋裤的质地、面料、款式......其乐无穷。当遇到不穿秋裤的人，穿着秋裤的人就像穿着破烂马褂的孔乙己，小心翼翼的不被看到裤脚露出的秋裤。美丽的姑娘不喜欢穿秋裤，她们认为秋裤显腿粗，其实根本没人在乎你的腿是否粗了0.001厘米，但她们坚持不穿秋裤。保守的人认为，只要天气一冷一定要穿上秋裤，否则一定会月经不调腰膝酸软. 穿，还是不穿，秋裤就在那里，不冷不热。测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突信仰是秋裤。在萧瑟的的秋冬给你最贴心的温暖，在宜人的春夏很难被想起。当一群都穿着秋裤的兄弟姐妹们聚在一起，会大谈秋裤的质地、面料、款式......其乐无穷。当遇到不穿秋裤的人，穿着秋裤的人就像穿着破烂马褂的孔乙己，小心翼翼的不被看到裤脚露出的秋裤。美丽的姑娘不喜欢穿秋裤，她们认为秋裤显腿粗，其实根本没人在乎你的腿是否粗了0.001厘米，但她们坚持不穿秋裤。保守的人认为，只要天气一冷一定要穿上秋裤，否则一定会月经不调腰膝酸软. 穿，还是不穿，秋裤就在那里，不冷不热。测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突信仰是秋裤。在萧瑟的的秋冬给你最贴心的温暖，在宜人的春夏很难被想起。当一群都穿着秋裤的兄弟姐妹们聚在一起，会大谈秋裤的质地、面料、款式......其乐无穷。当遇到不穿秋裤的人，穿着秋裤的人就像穿着破烂马褂的孔乙己，小心翼翼的不被看到裤脚露出的秋裤。美丽的姑娘不喜欢穿秋裤，她们认为秋裤显腿粗，其实根本没人在乎你的腿是否粗了0.001厘米，但她们坚持不穿秋裤。保守的人认为，只要天气一冷一定要穿上秋裤，否则一定会月经不调腰膝酸软. 穿，还是不穿，秋裤就在那里，不冷不热。测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突测试手势冲突信仰是秋裤。在萧瑟的的秋冬给你最贴心的温暖，在宜人的春夏很难被想起。当一群都穿着秋裤的兄弟姐妹们聚在一起，会大谈秋裤的质地、面料、款式......其乐无穷。当遇到不穿秋裤的人，穿着秋裤的人就像穿着破烂马褂的孔乙己，小心翼翼的不被看到裤脚露出的秋裤。美丽的姑娘不喜欢穿秋裤，她们认为秋裤显腿粗，其实根本没人在乎你的腿是否粗了0.001厘米，但她们坚持不穿秋裤。保守的人认为，只要天气一冷一定要穿上秋裤，否则一定会月经不调腰膝酸软. 穿，还是不穿，秋裤就在那里，不冷不热。";
    
    [testTextView setTextColor:[UIColor blackColor]];
    
    testTextView.backgroundColor = [UIColor lightGrayColor];
    
    testTextView.editable = NO;
    
    self.automaticallyAdjustsScrollViewInsets = NO ;
    
    
    [self.view addSubview:testTextView];
    //--------------------------------------------------------------------------------------------//
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
