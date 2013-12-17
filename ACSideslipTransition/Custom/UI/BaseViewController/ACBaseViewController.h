//
//  ACBaseViewController.h
//


#import <UIKit/UIKit.h>


@interface ACBaseViewController : UIViewController


//** 记录各个ViewController的状态栏配色 ***************************************************************

/** 状态栏颜色 */
@property (nonatomic) NSInteger lightStatusBarColor;

//************************************************************************************************//



//** 如果处于导航栏视图中，记录各个ViewController的配色 **************************************************

/** 导航栏背景颜色 */
@property (strong, nonatomic) UIColor *navigationBarBarTintColor;

/** 导航栏交互文字颜色 */
@property (strong, nonatomic) UIColor *navigationBarActionItemTintColor;

/** 导航栏标题颜色 */
@property (strong, nonatomic) UIColor *navigationBarTitleTextTintColor;

/** 导航栏标题颜色富属性 */
@property (strong, nonatomic) NSDictionary *navigationBarTitleTextAttributes;

//************************************************************************************************//


/** 用于界面之间通信的 键值对 */
@property (strong, nonatomic) NSDictionary *communicationDictionary;


@end
