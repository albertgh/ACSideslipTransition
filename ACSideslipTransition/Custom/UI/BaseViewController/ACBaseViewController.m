//
//  ACBaseViewController.m
//

#import "ACBaseViewController.h"
#import "UINavigationBar+TitleTextColor.h"


@interface ACBaseViewController ()
{
    
}

@end


@implementation ACBaseViewController

#pragma mark - Life Cycle

- (id)init
{
    self = [super init];
    if (self)
    {
        //-- 状态栏配颜色 ----------------------------------------------------------------------------
        
        
        //-----------------------------------------------------------------------------------------;
        
        
        //-- 导航栏配颜色 ----------------------------------------------------------------------------
        
        // 如果用户没有指定该 视图控制器 的导航栏底色，则从前一个中取，即继承之前的颜色
        if (!self.navigationBarBarTintColor)
        {
            self.navigationBarBarTintColor = self.navigationController.navigationBar.barTintColor;
        }
        
        // 如果用户没有指定该 视图控制器 的导航栏互动按钮文字颜色，则从前一个中取，即继承之前的颜色
        if (!self.navigationBarActionItemTintColor)
        {
            self.navigationBarActionItemTintColor = self.navigationController.navigationBar.tintColor;
        }
        
        // 如果没有指定该 视图控制器 的 导航栏标题颜色，则从前一个取
        if (!self.navigationBarTitleTextTintColor)
        {
           self.navigationBarTitleTextAttributes = self.navigationController.navigationBar.titleTextAttributes;
        }
        //-----------------------------------------------------------------------------------------;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //-- 背景 --------------------------------------------------------------------------------------
    self.view.backgroundColor = [UIColor colorWithRed:232 / 255.f green:242 / 255.f blue:250 / 255.f alpha:1.f];
    
    //---------------------------------------------------------------------------------------------;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //** 状态栏配色信息 ******************************************************************************
    // 状态栏文字颜色
    if (self.lightStatusBarColor)
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    //*********************************************************************************************;
    
    
    //** 导航栏底色、导航栏标题文字颜色、导航栏互动按钮文字颜色，恢复为四个属性指定的颜色 ***********************
    
    // 恢复导航栏底色
    self.navigationController.navigationBar.barTintColor = self.navigationBarBarTintColor;
    
    // 恢复导航栏互动按钮文字颜色
    self.navigationController.navigationBar.tintColor = self.navigationBarActionItemTintColor;
    
    // 如果没有指定颜色, 则从 self.navigationController.navigationBar.titleTextAttributes 自身容器中恢复颜色
    // 即 继承上一个颜色, 并把该字典保存下来 以便从 子视图 返回时 恢复这个颜色
    if (!self.navigationBarTitleTextTintColor)
    {
        // DLog(@"%@", self.navigationController.navigationBar.titleTextAttributes);
        // 由于导航栏 标题 的文字颜色是通过字典设定, 取出为 { NSColor = "UIDeviceRGBColorSpace 1 1 1 1"; }
        self.navigationController.navigationBar.titleTextAttributes = self.navigationBarTitleTextAttributes;
    }
    else
    {
        // 如果有设定颜色，则通过 类别 方法设定
        [self.navigationController.navigationBar doSetTitleTextColorBy:self.navigationBarTitleTextTintColor];
    }
    //*********************************************************************************************;
}

- (void)viewDidDisappear:(BOOL)animated
{
    
}


#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
